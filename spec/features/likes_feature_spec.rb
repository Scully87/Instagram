require 'rails_helper'
require 'helpers/photos_helper'

include PhotosHelper

feature 'liking photos' do

  scenario 'a user can like a photo, which updates the photo like count', js: true do
    create_post
    visit '/photos'
    click_link 'Like'
    expect(page).to have_content '1 Like'
  end

  scenario 'users cannot like their own photo', js: true do
    sign_up
    create_post
    expect(page).to_not have_content 'Like'
  end

  sceanrio 'users can like each photo once', js: true do
    visit '/'
    click_link 'Like'
    click_link 'Like'
    expect(page).to have_content '1 like'
  end

end