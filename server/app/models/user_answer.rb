class UserAnswer < ApplicationRecord
  belongs_to :user
  validates :question_id, presence: true
  validates :user_id, presence: true
  validates :answer, presence: true
end
