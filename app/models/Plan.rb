class Plan < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :start_time, presence: true
  validates :body, presence: true

end
