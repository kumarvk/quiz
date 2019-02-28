class Question < ApplicationRecord
  validates :title, presence: true
  validates :options, presence: true
end
