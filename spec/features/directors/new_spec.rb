require 'rails_helper'

# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

RSpec.describe 'the Director creation', type: :feature do
  it 'links to the new page from the directors index' do
    visit '/directors'

    click_link('New Director')

    expect(current_path).to eq('/directors/new')
  end

  it 'can create a new director' do
    visit '/directors/new'

    fill_in('Name', with: 'Spike Lee')
    fill_in('Birthdate', with: '1957-03-20')
    fill_in('Hometown', with: 'Atlanta')
    select('True', from: 'Active?')
    fill_in('Imdb rating', with: '5')
    click_button('Create Director')

    expect(current_path).to eq('/directors')
    expect(page).to have_content('Spike Lee')
  end

end
