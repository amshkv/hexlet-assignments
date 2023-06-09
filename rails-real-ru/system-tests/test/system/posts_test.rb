# frozen_string_literal: true

require 'application_system_test_case'

# BEGIN
class PostsTest < ApplicationSystemTestCase
  test 'visiting index page' do
    visit posts_url

    assert_selector 'h1', text: 'Posts'
  end

  test 'creating a Post' do
    params = {
      title: Faker::Book.title,
      body: Faker::Books::Dune.quote
    }

    visit posts_url

    click_on 'New Post'

    fill_in 'Title', with: params[:title]
    fill_in 'Body', with: params[:body]

    click_on 'Create Post'

    assert_text 'Post was successfully created'
    assert_text params[:title]
    assert_text params[:body]
  end

  test 'updating a Post' do
    visit posts_url
    click_on 'Edit', match: :first

    params = {
      title:Faker::Movies::HarryPotter.book,
      body: Faker::Movies::HarryPotter.quote
    }

    fill_in 'Title', with: params[:title]
    fill_in 'Body', with: params[:body]

    click_on 'Update Post'

    assert_text 'Post was successfully updated'
    assert_text params[:title]
    assert_text params[:body]
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
