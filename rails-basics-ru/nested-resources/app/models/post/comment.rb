# frozen_string_literal: true

class Post::Comment < ApplicationRecord
  belongs_to :post
  validates :body, presence: true
end
