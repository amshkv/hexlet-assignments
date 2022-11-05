# frozen_string_literal: true

require "test_helper"

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get bulletins_url

    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'should get show' do
    get bulletin_url(bulletins(:first))

    assert_response :success
    assert_select 'h1', 'Lala Jopa'
    assert_select 'p', 'Lorem ipsum dolor sit amet'
  end
end
