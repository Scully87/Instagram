module LikesHelper

  def sign_up_and_post
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
    visit('/')
    click_link('Add a photo')
    fill_in('Name', with: 'Food')
    click_button('Create Photo')
  end

end