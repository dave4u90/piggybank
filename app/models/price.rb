class Price < ApplicationRecord
  belongs_to :currency

  validates :volume_24h, :volume, :transition_time, :status, :session, :prev_close, :last, :current_time, :bid, :ask, presence: true
  validates :volume_24h, :volume, :session, :prev_close, :last, :bid, :ask, numericality: true 

  class << self
    def capture!
      prices = []
      currencies = Array Currency.select(:id, :code)

      # Atomic. All or none

      transaction do
        currencies.each do |currency|
          endpoint = URI "https://data.exchange.coinjar.com/products/#{currency.code}/ticker"

          begin
            response = Net::HTTP.get_response(endpoint)
          rescue SocketError
            return false
          end
          
          return unless response.is_a? Net::HTTPSuccess

          json = JSON.parse(response.body)

          price = currency.prices.new
          price_db_structure = Price.columns_hash

          json.keys.each do |attribute|
            begin
              case price_db_structure[attribute].type
              when :decimal
                json[attribute] = BigDecimal json[attribute]
              when :datetime
                json[attribute] = Time.zone.parse json[attribute] 
              else
                json[attribute] = json[attribute]
              end
            rescue TypeError, ArgumentError => e
              Rails.logger.error "API::DataError, #{e.message}"
              return false
            rescue Exception => e
              Rails.logger.error "API::Outdated, #{e.message}"
              return false
            end
          end

          price.assign_attributes(json)
          prices << price
        end

        return false unless (prices.compact.count == currencies.count && prices.all?(&:valid?))
        prices.each(&:save)
      end

      true
    end
  end
end
