class Todo < ApplicationRecord
  validates :title, presence: true
  validates :status, inclusion: { in: ['pending', 'in_progress', 'completed'] }
end