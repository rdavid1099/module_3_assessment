require 'rails_helper'

describe 'user can search for nearby stores' do
  it 'enters a zipcode and sees all the stores in the region' do
    visit root_path
    fill_in 'zipcode', with: '80202'
    click_on 'Search'

    expect(current_path).to eq('/search?zipcode=80202')
    expect(page).to have_content('Stores within 25 miles of 80202')
    expect(page).to have_content('17 Total Stores')
    within('.results') do
      expect(page).to have_content('Best Buy Mobile - Cherry Creek Shopping Center')
      expect(page).to have_content('Denver')
      expect(page).to have_content('3.25')
      expect(page).to have_content('303-270-9189')
      expect(page).to have_content('Mobile')
    end
  end
end
