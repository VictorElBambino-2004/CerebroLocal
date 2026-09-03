require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  test "recargar play conserva la misma pregunta" do
    question = Question.create!(
      prompt: "¿Cuál es la capital de Francia?",
      category: "Geografía",
      options: [ "París", "Roma", "Lima", "Quito" ],
      correct_answer: "París"
    )

    with_generated_question(question) do
      post games_path, params: { players: [ "Ana" ] }
      get play_games_path
      first_question_id = session[:current_question_id]

      get play_games_path

      assert_equal first_question_id, session[:current_question_id]
      assert_select ".cl-question-text", text: question.prompt
    end
  end

  test "rechaza responder una pregunta que no es la activa" do
    active_question = Question.create!(
      prompt: "¿Cuál es la capital de Argentina?",
      category: "Geografía",
      options: [ "Buenos Aires", "Bogotá", "Santiago", "Montevideo" ],
      correct_answer: "Buenos Aires"
    )
    other_question = Question.create!(
      prompt: "¿Cuál es la capital de Chile?",
      category: "Geografía",
      options: [ "Santiago", "Lima", "Quito", "Caracas" ],
      correct_answer: "Santiago"
    )

    with_generated_question(active_question) do
      post games_path, params: { players: [ "Ana" ] }
      get play_games_path

      post answer_games_path, params: { question_id: other_question.id, answer: "Santiago" }

      assert_redirected_to play_games_path
      assert_equal 0, session[:question_count]
      assert_equal active_question.id, session[:current_question_id]
    end
  end

  private

  def with_generated_question(question)
    original_method = AiQuestionGenerator.method(:fetch_or_generate)
    AiQuestionGenerator.define_singleton_method(:fetch_or_generate) { |*_args| question }
    yield
  ensure
    AiQuestionGenerator.define_singleton_method(:fetch_or_generate, original_method)
  end
end
