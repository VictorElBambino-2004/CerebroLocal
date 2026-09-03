require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "solo el anfitrion puede iniciar una sala" do
    room = Room.create!(status: "waiting")

    post start_room_path(room.code)

    assert_redirected_to root_path
    assert_equal "waiting", room.reload.status
  end
end
