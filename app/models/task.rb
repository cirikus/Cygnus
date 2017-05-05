class Task < ApplicationRecord

    has_many :comments, dependent: :destroy

    #This validates presence of title, and makes sure that the length is not more than 140 words
    validates :title, presence: true, length: {maximum: 50}
    #This validates presence of body
    validates :body, presence: true

    #Return number of comment for one task
    def count_of_comment
      Comment.number_of_comment(self)
    end

    #Return date of the last comment
    def date_of_last_comment
      last_comment = Comment.last_comment(self)
      if !last_comment.nil?
        last_comment.created_at.to_s(:custom_datetime)
      end
    end
    
    def self.to_csv(options = {})
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |task|
          csv << task.attributes.values_at(*column_names)
        end
      end
    end

end
