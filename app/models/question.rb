class Question < ApplicationRecord
  validates :prompt, presence: true, uniqueness: true
  validates :category, presence: true
  validates :correct_answer, presence: true
end
