require 'rails_helper'
require 'helpers/photos_helper'

include PhotosHelper

feature 'liking photos' do

  scenario 'a user can like a photo, which updates the photo like count', js: true do
    create_post
    visit '/photos'
    click_link 'Like'
    expect(page).to have_content('1 Like')
  end

end