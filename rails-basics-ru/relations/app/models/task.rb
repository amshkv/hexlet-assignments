class Task < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  belongs_to :status
end
