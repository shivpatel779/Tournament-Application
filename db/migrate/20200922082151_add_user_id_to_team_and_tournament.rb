class AddUserIdToTeamAndTournament < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :user_id, :integer
    add_column :tournaments, :user_id, :integer
  end
end
