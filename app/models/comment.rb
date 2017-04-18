class Comment < ApplicationRecord

  	belongs_to :task
  	default_scope -> { order(created_at: :desc) }
  	validates :task_id, presence: true
  	validates :content, presence: true, length: { maximum: 500}

	#Return last comment of one task
  	def self.number_of_comment(task)
  		task.comments.count
 	end

  	#Return last comment of one task
  	def self.last_comment(task)
  		task.comments.last
 	end

end
