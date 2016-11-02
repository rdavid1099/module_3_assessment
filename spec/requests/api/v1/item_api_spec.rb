require 'rails_helper'

describe 'item api' do
  it 'returns json of all items in database' do
    Item.create(name: 'test1')
    Item.create(name: 'test2')
  end
end


# When I send a GET request to /api/v1/items I receive a 200 JSON
# response containing all items And each item has an id, name, description,
# and image_url but not the created_at or updated_at
#
# When I send a GET request to /api/v1/items/1 I receive a 200 JSON response
# containing the id, name, description, and image_url but not the created_at or
# updated_at
#
# When I send a DELETE request to /api/v1/items/1 I receive a 204 JSON
# response if the record is successfully deleted
#
# When I send a POST request to /api/v1/items with a name, description, and
# image_url I receive a 201 JSON response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and
# image_url but not the created_at or updated_at
