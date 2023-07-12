# frozen_string_literal: true

require 'test_helper'

class Web::RepositoriesControllerTest < ActionDispatch::IntegrationTest
  # BEGIN
  test 'should create repository' do
    repos = 'amshkv/rails-project-65'
    link = "https://github.com/#{repos}"
    stub_link = "https://api.github.com/repos/#{repos}"
    info = load_fixture('files/response.json')
    parsed_info = JSON.parse(info)

    stub_request(:get, stub_link).to_return(body: info)

    post repositories_url, params: { repository: { link: } }

    repository = Repository.find_by(link:)

    assert_response :redirect
    assert repository.owner_name == parsed_info['owner']['login']
    assert repository.repo_name == parsed_info['name']
    assert repository.description == parsed_info['description']
    assert repository.default_branch == parsed_info['default_branch']
    assert repository.watchers_count == parsed_info['watchers_count']
    assert repository.language == parsed_info['language']
    assert repository.repo_created_at == parsed_info['created_at']
    assert repository.repo_updated_at == parsed_info['updated_at']
  end
  # END
end
