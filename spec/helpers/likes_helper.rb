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

  def sign_up_first_test_user
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'first@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def sign_up_second_test_user
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'second@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

end