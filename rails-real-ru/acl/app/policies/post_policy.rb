# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN
  def new?
    user
  end

  def create?
    user
  end

  def edit?
    admin? || author?
  end

  def update?
    admin? || record.author == user
  end

  def destroy?
    admin?
  end

  private

  def admin?
    user&.admin?
  end

  def author?
    record.author == user
  end
  # END
end
