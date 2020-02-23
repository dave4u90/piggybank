# Source https://api.exchange.coinjar.com/products

[
  { code: "BTCAUD", name: "BTC/AUD" },
  { code: "ETHAUD", name: "ETH/AUD" },
  { code: "ETHBTC", name: "ETH/BTC" },
  { code: "XRPAUD", name: "XRP/AUD" },
  { code: "XRPBTC", name: "XRP/BTC" },
  { code: "LTCAUD", name: "LTC/AUD" },
  { code: "LTCBTC", name: "LTC/BTC" },
  { code: "ZECAUD", name: "ZEC/AUD" },
  { code: "ZECBTC", name: "ZEC/BTC" },
  { code: "BTC-USDC", name: "BTC/USDC" },
  { code: "USDC-AUD", name: "USDC/AUD" },
  { code: "ZRXBTC", name: "ZRX/BTC" },
  { code: "ZRXAUD", name: "ZRX/AUD" },
  { code: "BATBTC", name: "BAT/BTC" },
  { code: "BATAUD", name: "BAT/AUD" }
].each do |product|
  Currency.where(product).first_or_create
end
