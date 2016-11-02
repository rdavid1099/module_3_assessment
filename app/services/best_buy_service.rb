class BestBuyService
  def initialize
    @api_key = ENV['BEST_BUY_API_KEY']
  end

  def find_nearby_stores(zipcode)
    JSON.parse(zip_search_response(zipcode).body, symbolize_names: true)[:stores]
  end

  private
    attr_reader :api_key

    def conn
      Faraday.new('https://api.bestbuy.com')
    end

    def zip_search_response(zipcode)
      conn.get "/v1/stores(area(#{zipcode},25))", {
        format: 'json',
        show: 'longName,city,distance,phone,storeType',
        pageSize: 25,
        apiKey: ENV['BEST_BUY_API_KEY']
      }
    end
end
