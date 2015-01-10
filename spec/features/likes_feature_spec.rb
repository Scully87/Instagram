require 'rails_helper'

feature 'liking photos' do

  scenario 'a user can like a photo, which updates the photo like count' do
    visit '/photos'
    click_link 'Like Food'
    expect(page).to have_content('1 like')
  end
  scenario 'a user can like a review, which increments the like count', js: true do
    visit '/photos'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

end