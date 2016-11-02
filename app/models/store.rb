class Store
  def initialize(data)
    @data = data
  end

  def self.all_by_zipcode(zipcode)
    raw_stores = BestBuyService.new.find_nearby_stores(zipcode)
    raw_stores.map do |raw_store_data|
      Store.new(raw_store_data)
    end
  end

  def long_name
    data[:longName]
  end

  def city
    data[:city]
  end

  def distance
    data[:distance]
  end

  def phone
    data[:phone]
  end

  def store_type
    data[:storeType]
  end

  private
    attr_reader :data
end
