# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
  test 'visiting index page' do
    visit posts_url

    assert_selector 'h1', text: 'Posts'
    assert_selector 'table'
    assert_selector 'a', text: 'New Post'
  end

  test 'creating a Post' do
    visit posts_url

    click_on 'New Post'

    fill_in 'Title', with: 'Creating a Post'
    fill_in 'Body', with: 'Created this post successfully!'

    click_on 'Create Post'

    assert_text 'Post was successfully created'
  end

  test 'updating a Post' do
    visit posts_url
    click_on 'Edit', match: :first

    fill_in 'Title', with: 'Creating a Post'
    fill_in 'Body', with: 'Created this post successfully!'

    click_on 'Update Post'

    assert_text 'Post was successfully updated'
  end

  test 'destroying a Post' do
    visit posts_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Post was successfully destroyed'
  end
end
# END
