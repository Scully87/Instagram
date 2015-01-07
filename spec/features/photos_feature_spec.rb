require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos'
      expect(page).to have_button 'Add a photo'
    end
  end
	context 'photos have been added' do

	  before do
	    Photo.create(name: 'Food')
	  end

	  scenario 'display photos' do
	    visit '/photos'
	    expect(page).to have_content('Food')
	    expect(page).not_to have_content('No photos')
	  end
	end
	context 'creating photos' do
		scenario 'prompts user to fill out a form, then displays the new photo' do
		  visit '/photos'
		  click_button 'Add a photo'
		  fill_in 'Name', with: 'Food'
		  click_button 'Create Food'
		  expect(page).to have_content 'Food'
		  expect(current_path).to eq '/photos'
		end
	end
end