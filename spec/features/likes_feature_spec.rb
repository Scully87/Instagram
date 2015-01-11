require 'rails_helper'
require 'helpers/likes_helper'

include LikesHelper

feature 'liking photos' do

  scenario 'is initially at 0 likes' do
    create_post
    visit '/photos'
    expect(page).to have_content '♥ 0'
  end

  context 'when signed in' do
    scenario 'a user can like a photo, which updates the photo like count', js: true do
      sign_up_and_post
      visit '/photos'
      click_link '♥'
      expect(page).to have_content '♥ 1'
    end
    scenario 'users can only like each photo once', js: true do
      sign_up_and_post
      visit '/photos'
      click_link '♥'
      click_link '♥'
      expect(page).to have_content '♥ 1'
    end
  end

  context 'when not signed in' do
    scenario 'users cannot like a photo' do
      visit '/photos'
      expect(page).to_not have_link '♥'
    end
  end

end