require 'rails_helper'

feature 'photos' do

  context 'no photos have been added' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos'
      expect(page).to have_content 'Add a photo'
    end
  end

    context 'photos have been added' do
        
        before {Photo.create name: 'Food'}
      
      scenario 'display photos' do
        visit '/photos'
        expect(page).to have_content('Food')
        expect(page).not_to have_content('No photos')
      end
    end

    context 'creating photos' do
        scenario 'prompts user to fill out a form, then displays the new photo' do
          visit '/photos'
          click_link 'Add a photo'
          fill_in 'Name', with: 'Food'
          click_button 'Create Photo'
          expect(page).to have_content 'Food'
          expect(current_path).to eq '/photos'
        end
    end

    context 'editing photos' do
        
        before {Photo.create name: 'Food'}

    scenario 'let a user edit a photo' do
       visit '/photos'
       click_link 'Edit Food'
       fill_in 'Name', with: 'Mega Foodz'
       click_button 'Update Photo'
       expect(page).to have_content 'Mega Foodz'
       expect(current_path).to eq '/photos'
      end
    end

    context 'deleting photos' do
        
        before {Photo.create name: 'Food'}

      scenario 'removes a photo when a user clicks a delete link' do
        visit '/photos'
        click_link 'Delete Food'
        expect(page).not_to have_content 'Food'
        expect(page).to have_content 'Photo deleted'
      end
    end

    context 'deleting photos' do

      before {Photo.create name: 'Food'}

      scenario 'removes a photo when a user clicks a delete link' do
        visit '/photos'
        click_link 'Delete Food'
        expect(page).not_to have_content 'Food'
        expect(page).to have_content 'Photo deleted'
      end
    end

end