class AddApprovedFieldInTournamentTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :tournament_teams, :is_approved, :boolean, default: false
  end
end
