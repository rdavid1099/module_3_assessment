require 'rails_helper'

describe 'BestBuyService' do
  it 'finds stores by given zipcode' do
    VCR.use_cassette('service_search_by_zipcode') do
      service = BestBuyService.new
      result = service.find_nearby_stores('80202')

      expect(result.count).to eq(17)
      expect(result.first[:longName]).to eq('Best Buy Mobile - Cherry Creek Shopping Center')
      expect(result.first[:city]).to eq('Denver')
      expect(result.first[:distance]).to eq(3.25)
      expect(result.first[:phone]).to eq('303-270-9189')
      expect(result.first[:storeType]).to eq('Mobile')
    end
  end
end
