require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "solo el anfitrion puede iniciar una sala" do
    room = Room.create!(status: "waiting")

    post start_room_path(room.code)

    assert_redirected_to root_path
    assert_equal "waiting", room.reload.status
  end

  test "el anfitrion puede ver e iniciar su sala con su token" do
    post rooms_path
    room = Room.order(:created_at).last
    room.players.create!(name: "Ana")

    get host_room_path(room.code, host_token: room.host_token)

    assert_response :success

    post start_room_path(room.code, host_token: room.host_token)

    assert_redirected_to play_games_path
    assert_equal "playing", room.reload.status
  end

  test "rechaza ver una sala con un token incorrecto" do
    room = Room.create!(status: "waiting")

    get host_room_path(room.code, host_token: "invalid")

    assert_response :not_found
  end
end
