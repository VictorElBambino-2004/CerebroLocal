class GamesController < ApplicationController
  QUESTIONS_PER_PLAYER = 5

  CATEGORIES = [
    "Historia", "Ciencia", "Deportes", "Geografía",
    "Arte", "Entretenimiento", "Tecnología", "Cine",
    "Música", "Naturaleza", "Literatura"
  ].freeze

  def new
    redirect_to root_path
  end

  def create
    raw_players = params[:players].to_a.map { |n| ActionController::Base.helpers.strip_tags(n.to_s).strip }.reject(&:blank?).first(8)
    raw_players = ["Jugador 1"] if raw_players.blank?

    session[:players] = raw_players.map { |name| { "name" => name.truncate(30), "score" => 0 } }
    session[:current_turn] = 0
    session[:asked_question_ids] = []
    session[:asked_prompts] = []
    session[:question_count] = 0

    redirect_to play_games_path
  end

  def play
    return redirect_to root_path if session[:players].blank?

    session[:asked_question_ids] ||= []
    session[:asked_prompts] ||= []
    session[:question_count] ||= 0

    if session[:question_count] >= max_questions
      return redirect_to game_over_games_path
    end

    @current_player = session[:players][session[:current_turn]]
    @category = CATEGORIES.sample
    @question = AiQuestionGenerator.fetch_or_generate(
      @category,
      session[:asked_question_ids],
      session[:asked_prompts]
    )

    session[:asked_question_ids] << @question.id
    session[:asked_prompts] << @question.prompt
    @total_questions = max_questions
    @current_question_number = session[:question_count] + 1
  end

  def answer
    question = Question.find_by(id: params[:question_id])
    player = session[:players][session[:current_turn]]

    if question
      if params[:answer] == question.correct_answer
        player["score"] += 10
        flash[:notice] = "¡Correcto #{player['name']}! (+10 pts)"
      else
        flash[:alert] = "Incorrecto #{player['name']}. Era: #{question.correct_answer}"
      end
    end

    session[:question_count] = session[:question_count].to_i + 1

    if session[:question_count] >= max_questions
      redirect_to game_over_games_path
    else
      next_turn
      redirect_to action: :play
    end
  end

  def game_over
    return redirect_to root_path if session[:players].blank?

    @ranking = session[:players].sort_by { |p| -p["score"] }
  end

  private

  def max_questions
    (session[:players]&.size || 1) * QUESTIONS_PER_PLAYER
  end

  def next_turn
    total = session[:players].size
    session[:current_turn] = (session[:current_turn] + 1) % total
  end
end