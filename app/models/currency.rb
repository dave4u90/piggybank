class Currency < ApplicationRecord
  has_many :prices

  def latest_price
    prices.last&.last
  end

  def previous_price
    prices.last&.prev_close
  end
end
