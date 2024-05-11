class Plan < ApplicationRecord
  belongs_to :user


  #追加
  validates :title, presence: true, length: { maximum: 50 } #最大文字数５０文字
  validates :content, presence: true
  validates :start_time, presence: true
  validates :user_id, presence: true

end
