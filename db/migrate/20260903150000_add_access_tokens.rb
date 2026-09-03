class AddAccessTokens < ActiveRecord::Migration[8.1]
  def up
    add_column :rooms, :host_token, :string
    add_column :players, :token, :string
    add_index :rooms, :host_token, unique: true
    add_index :players, :token, unique: true

    Room.reset_column_information
    Player.reset_column_information
    Room.find_each { |room| room.update_columns(host_token: SecureRandom.urlsafe_base64(32)) }
    Player.find_each { |player| player.update_columns(token: SecureRandom.urlsafe_base64(32)) }
  end

  def down
    remove_index :players, :token
    remove_index :rooms, :host_token
    remove_column :players, :token
    remove_column :rooms, :host_token
  end
end
