require 'rails_helper'

describe 'Store' do
  it 'gathers collection of stores' do
    VCR.use_cassette('model_store PORO') do
      stores = Store.all_by_zipcode('80202')

      expect(stores.count).to eq(17)
      expect(stores.first.long_name).to eq('Best Buy Mobile - Cherry Creek Shopping Center')
      expect(stores.first.city).to eq('Denver')
      expect(stores.first.distance).to eq(3.25)
      expect(stores.first.phone).to eq('303-270-9189')
      expect(stores.first.store_type).to eq('Mobile')
    end
  end
end
