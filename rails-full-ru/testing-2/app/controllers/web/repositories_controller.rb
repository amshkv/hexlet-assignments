# frozen_string_literal: true

# BEGIN
require 'octokit'
# END

class Web::RepositoriesController < Web::ApplicationController
  def index
    @repositories = Repository.all
  end

  def new
    @repository = Repository.new
  end

  def show
    @repository = Repository.find params[:id]
  end

  def create
    # BEGIN
    @repository = Repository.new(permitted_params)

    repository = Octokit::Repository.from_url(@repository.link)

    response = Octokit.repository(repository)
    json_response = JSON.parse(response)

    @repository.owner_name = json_response['owner']['login']
    @repository.repo_name = json_response['name']
    @repository.description = json_response['description']
    @repository.default_branch = json_response['default_branch']
    @repository.watchers_count = json_response['watchers_count']
    @repository.language = json_response['language']
    @repository.repo_created_at = json_response['created_at']
    @repository.repo_updated_at = json_response['updated_at']

    if @repository.save
      redirect_to repositories_path, notice: t('success')
    else
      flash[:notice] = t('fail')
      render :new, status: :unprocessable_entity
    end
    # END
  end

  def edit
    @repository = Repository.find params[:id]
  end

  def update
    @repository = Repository.find params[:id]

    if @repository.update(permitted_params)
      redirect_to repositories_path, notice: t('success')
    else
      flash[:notice] = t('fail')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @repository = Repository.find params[:id]

    if @repository.destroy
      redirect_to repositories_path, notice: t('success')
    else
      redirect_to repositories_path, notice: t('fail')
    end
  end

  private

  def permitted_params
    params.require(:repository).permit(:link)
  end
end
