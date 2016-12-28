class Comment < ApplicationRecord
  belongs_to :task
  default_scope -> { order(created_at: :desc) }
  validates :task_id, presence: true
  validates :content, presence: true, length: { maximum: 500}
end
