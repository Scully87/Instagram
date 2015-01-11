require 'rails_helper'
require 'helpers/likes_helper'

include LikesHelper

feature 'liking photos' do

  context 'when signed in' do
    before {Photo.create name: 'Food'}
    scenario 'a user can like a photo, which updates the photo like count', js: true do
      sign_up_first_test_user
      visit '/photos'
      click_link 'Like'
      expect(page).to have_content '1 Like'
    end
  end

  scenario 'users cannot like their own photo', js: true do
    sign_up_and_post
    visit '/photos'
    expect(page).to_not have_link 'Like'
  end

  scenario 'users can only like each photo once', js: true do
    visit '/photos'
    # save_and_open_page
    click_link 'Like'
    click_link 'Like'
    expect(page).to have_content '1 like'
  end

end