require 'rails_helper'

describe 'item api' do
  it 'returns json of all items in database' do
    Item.create(name: 'test1',
                description: 'Test descrip',
                image_url: 'test.com')
    Item.create(name: 'test2')
    get '/api/v1/items'
    result = JSON.parse(response.body, symbolize_names: true)

    expect(result.count).to eq(2)
    expect(result.first[:name]).to eq('test1')
    expect(result.first[:description]).to eq('Test descrip')
    expect(result.first[:image_url]).to eq('test.com')
    expect(result.last[:name]).to eq('test2')
  end

  it 'returns json of one item in the database' do
    item = Item.create(name: 'test1',
                description: 'Test descrip',
                image_url: 'test.com')
    Item.create(name: 'test2')
    get "/api/v1/items/#{item.id}"
    result = JSON.parse(response.body, symbolize_names: true)

    expect(result[:name]).to eq('test1')
    expect(result[:description]).to eq('Test descrip')
    expect(result[:image_url]).to eq('test.com')
  end

  it 'returns error if item is not found' do
    item = Item.create(name: 'test1',
                description: 'Test descrip',
                image_url: 'test.com')
    get "/api/v1/items/1234356"
    result = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(404)
    expect(result[:message]).to eq('Item not found')
  end

  it 'deletes items from the database' do
    item = Item.create(name: 'test1',
                description: 'Test descrip',
                image_url: 'test.com')

    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{item.id}"

    expect(Item.count).to eq(0)
  end
end

# When I send a DELETE request to /api/v1/items/1 I receive a 204 JSON
# response if the record is successfully deleted
#
# When I send a POST request to /api/v1/items with a name, description, and
# image_url I receive a 201 JSON response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and
# image_url but not the created_at or updated_at
