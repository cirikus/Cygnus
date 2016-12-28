class Task < ApplicationRecord
    #This validates presence of title, and makes sure that the length is not more than 140 words
    validates :title, presence: true, length: {maximum: 140}
    #This validates presence of body
    validates :body, presence: true
    has_many :comments, dependent: :destroy

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
    csv << column_names
    all.each do |task|
      csv << task.attributes.values_at(*column_names)
    end
    end
  end

end
