# frozen_string_literal: true

require 'application_system_test_case'

class Post::CommentsTest < ApplicationSystemTestCase
  test 'creating a Comment' do
    comment_body = Faker::Movies::HarryPotter.quote

    visit posts_url

    click_on 'Show', match: :first

    fill_in 'post_comment_body', with: comment_body

    click_on 'Create Comment'

    assert_text 'Comment was successfully created'
    assert_text comment_body
  end

  test 'updating a Comment' do
    visit posts_url
    click_on 'Show', match: :first
    click_on 'Edit', match: :first

    comment_body = Faker::Movies::HarryPotter.book

    fill_in 'post_comment_body', with: comment_body

    click_on 'Update Comment'

    assert_text 'Comment was successfully updated'
    assert_text comment_body
  end

  test 'destroying a Comment' do
    visit posts_url
    click_on 'Show', match: :first
    page.accept_confirm do
      click_on 'Delete', match: :first
    end
  end
end
