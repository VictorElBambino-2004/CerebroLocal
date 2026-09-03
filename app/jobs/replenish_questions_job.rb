class ReplenishQuestionsJob < ApplicationJob
  queue_as :default

  def perform(category, amount = 1)
    amount.times do
      AiQuestionGenerator.generate(category)
    end
  end
end