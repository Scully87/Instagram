require 'rails_helper'
require 'helpers/photos_helper'

include PhotosHelper

feature 'photos' do

  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos'
      expect(page).to have_content 'Add a photo'
    end
  end

  context 'photos have been added' do
    
    scenario 'display post with name' do
      create_post
      visit '/photos'
      expect(page).to have_content 'Food'
      expect(page).not_to have_content 'No photos' 
    end
    scenario 'display post with photo' do
      create_post
      visit '/photos'
      expect(page).to have_css 'img'
      expect(page).not_to have_content 'No photos' 
    end
  end

  context 'creating photos' do
    scenario 'prompts user to fill out a form, then displays the new photo' do
      sign_up
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'Name', with: 'Food'
      attach_file('photo[image]', 'spec/fixtures/files/test.jpg')
      click_button 'Create Photo'
      expect(page).to have_content 'Food'
      expect(page).to have_css 'img'
      expect(current_path).to eq '/photos'
    end
  end

  context 'editing photos' do
    scenario 'let a user edit a photo' do
      create_post
      visit '/photos'
      click_link 'Edit Food'
      fill_in 'Name', with: 'Mega Foodz'
      attach_file('photo[image]', 'spec/fixtures/files/test2.jpg')
      click_button 'Update Photo'
      expect(page).to have_content 'Mega Foodz'
      expect(page).to have_css 'img'
      expect(current_path).to eq '/photos'
    end
  end

  context 'deleting photos' do
    scenario 'removes a photo when a user clicks a delete link' do
      create_post
      visit '/photos'
      click_link 'Delete Food'
      expect(page).not_to have_content 'Food'
      expect(page).not_to have_css 'img'
      expect(page).to have_content 'Photo deleted'
    end
  end

end