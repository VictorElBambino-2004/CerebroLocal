require "test_helper"

class AiQuestionGeneratorTest < ActiveSupport::TestCase
  test "rechaza opciones duplicadas" do
    data = {
      "prompt" => "¿Cuál es la capital de Francia?",
      "options" => [ "París", "París", "Roma", "Lima" ],
      "correct_answer" => "París"
    }

    assert_not AiQuestionGenerator.valid_data?(data)
  end

  test "no repite fallbacks cuando se agota el banco" do
    prompts = AiQuestionGenerator::FALLBACKS.values.flatten.map { |question| question[:prompt] }

    assert_nil AiQuestionGenerator.fallback_question("Historia", prompts)
  end
end
