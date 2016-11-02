class SearchesController < ApplicationController
  def index
    @stores = find_nearby_stores(params[:zipcode])
    @zipcode = params[:zipcode]
  end

  def find_nearby_stores(zipcode)
    conn = Faraday.new('https://api.bestbuy.com')
    response = conn.get "/v1/stores(area(#{zipcode},25))", {
      format: 'json',
      show: 'longName,city,distance,phone,storeType',
      pageSize: 25,
      apiKey: ENV['BEST_BUY_API_KEY']
    }
    JSON.parse(response.body, symbolize_names: true)[:stores]
  end
end
