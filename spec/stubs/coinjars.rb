require 'rails_helper'

module Stubs
  module Coinjars
    def btcaud_success!
      btcaud_response = "{\"volume_24h\":\"12.39500000\",\"volume\":\"2.40900000\",\"transition_time\":\"2020-02-22T15:50:00Z\",\"status\":\"continuous\",\"session\":21530,\"prev_close\":\"14565.00000000\",\"last\":\"14590.00000000\",\"current_time\":\"2020-02-22T13:51:31.900007Z\",\"bid\":\"14590.00000000\",\"ask\":\"14620.00000000\"}"

      stub_request(:get, "https://data.exchange.coinjar.com/products/BTCAUD/ticker").
        with(
          headers: {
       	    'Accept'=>'*/*',
       	    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	    'Host'=>'data.exchange.coinjar.com',
       	    'User-Agent'=>'Ruby'
          }).
        to_return(status: 200, body: btcaud_response, headers: {})
    end

    def ethaud_success!
      ethaud_response = "{\"volume_24h\":\"36.700000000\",\"volume\":\"2.500000000\",\"transition_time\":\"2020-02-22T15:50:00Z\",\"status\":\"continuous\",\"session\":21530,\"prev_close\":\"397.40000000\",\"last\":\"400.90000000\",\"current_time\":\"2020-02-22T13:52:58.984706Z\",\"bid\":\"396.40000000\",\"ask\":\"402.00000000\"}"

      stub_request(:get, "https://data.exchange.coinjar.com/products/ETHAUD/ticker").
        with(
          headers: {
       	    'Accept'=>'*/*',
       	    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	    'Host'=>'data.exchange.coinjar.com',
       	    'User-Agent'=>'Ruby'
          }).
        to_return(status: 200, body: ethaud_response, headers: {})
    end

    def btcaud_error!
      stub_request(:get, "https://data.exchange.coinjar.com/products/BTCAUD/ticker").
        with(
          headers: {
       	    'Accept'=>'*/*',
       	    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	    'Host'=>'data.exchange.coinjar.com',
       	    'User-Agent'=>'Ruby'
          }).
        to_raise SocketError
    end

    def ethaud_error!
      stub_request(:get, "https://data.exchange.coinjar.com/products/ETHAUD/ticker").
        with(
          headers: {
       	    'Accept'=>'*/*',
       	    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	    'Host'=>'data.exchange.coinjar.com',
       	    'User-Agent'=>'Ruby'
          }).
        to_raise SocketError
    end

    def ethaud_invalid!
      ethaud_response = "{\"volume_24h\":\"invalid\",\"volume\":\"2.500000000\",\"transition_time\":\"2020-02-22T15:50:00Z\",\"status\":\"continuous\",\"session\":21530,\"prev_close\":\"397.40000000\",\"last\":\"400.90000000\",\"current_time\":\"2020-02-22T13:52:58.984706Z\",\"bid\":\"396.40000000\",\"ask\":\"402.00000000\"}"

      stub_request(:get, "https://data.exchange.coinjar.com/products/ETHAUD/ticker").
        with(
          headers: {
       	    'Accept'=>'*/*',
       	    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	    'Host'=>'data.exchange.coinjar.com',
       	    'User-Agent'=>'Ruby'
          }).
        to_return(status: 200, body: ethaud_response, headers: {})
    end
    
    def stub_complete_success!
      btcaud_success!
      ethaud_success!
    end

    def stub_partial_success!
      btcaud_error!
      ethaud_success!
    end

    def stub_full_failure!
      btcaud_error!
      ethaud_error!
    end

    def stub_invalid!
      btcaud_success!
      ethaud_invalid!
    end
  end
end
