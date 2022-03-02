class Task < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  # validates :mark_as_done, default: false
  # validates :priority, default: 3
end
