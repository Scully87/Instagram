module PhotosHelper

  def sign_up
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def create_post
    sign_up
    visit('/')
    click_link('Add a photo')
    fill_in('Name', with: 'Food')
    attach_file('photo[image]', 'spec/fixtures/files/test.jpg')
    click_button('Create Photo')
  end

end
