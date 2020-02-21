class Price < ApplicationRecord
  belongs_to :currency

  class << self
    def capture!
      # Atomic. All or none
      transaction do
        Currency.select(:id, :code).each do |currency|
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

              price.assign_attributes(json)
            rescue TypeError, ArgumentError => e
              Rails.logger.error "API::DataError, #{e.message}"
              return false
            rescue Exception => e
              Rails.logger.error "API::Outdated, #{e.message}"
              return false
            end
          end

          return unless price.save
        end
      end

      true
    end
  end
end
