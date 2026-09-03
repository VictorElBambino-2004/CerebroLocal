class RoomsController < ApplicationController
  def new
    session[:players] = nil
    session[:current_turn] = nil
    session[:asked_question_ids] = nil
    session[:asked_prompts] = nil
    session[:question_count] = nil
    session[:current_question_id] = nil
    session[:host_room_id] = nil
  end

  def create
    @room = Room.create!(status: "waiting")
    session[:host_room_id] = @room.id
    redirect_to host_room_path(@room.code, host_token: @room.host_token)
  end

  def host
    @room = Room.find_by!(code: params[:id])
    return unless verify_host_access!
    @players = @room.players
  end

  def join
    @room = Room.find_by(code: params[:code]&.strip)
    if @room && @room.status == "waiting"
      safe_name = ActionController::Base.helpers.strip_tags(params[:name].to_s).strip.truncate(30)
      safe_name = "Jugador" if safe_name.blank?
      if @room.players.count >= 8
        flash[:alert] = "La sala está llena (máximo 8 jugadores)"
        return redirect_to root_path
      end
      player = @room.players.create!(name: safe_name)
      redirect_to player_room_path(@room.code, player_id: player.id, player_token: player.token)
    else
      flash[:alert] = @room ? "La partida ya comenzó" : "Sala no encontrada"
      redirect_to root_path
    end
  end

  def player
    @room = Room.find_by!(code: params[:id])
    @player = @room.players.find(params[:player_id])
    head :not_found unless ActiveSupport::SecurityUtils.secure_compare(@player.token.to_s, params[:player_token].to_s)
  end

  def start
    @room = Room.find_by!(code: params[:id])

        unless session[:host_room_id].to_i == @room.id &&
          ActiveSupport::SecurityUtils.secure_compare(@room.host_token, params[:host_token].to_s)
      flash[:alert] = "No tienes permiso para iniciar esta sala"
      return redirect_to root_path
        end

    if @room.players.empty?
      flash[:alert] = "¡Ingresa con el PIN desde otro dispositivo antes de empezar!"
      return redirect_to host_room_path(@room.code, host_token: @room.host_token)
    end

    @room.update!(status: "playing")
    session[:players] = @room.players.first(8).map { |p| { "name" => p.name, "score" => 0 } }
    session[:current_turn] = 0
    session[:asked_question_ids] = []
    session[:asked_prompts] = []
    session[:question_count] = 0
    session[:current_question_id] = nil

    redirect_to play_games_path
  end

  def verify_host_access!
    return true if ActiveSupport::SecurityUtils.secure_compare(@room.host_token.to_s, params[:host_token].to_s)

    head :not_found
    false
  end
end
