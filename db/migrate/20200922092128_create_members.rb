class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.integer :team_id
      t.integer :tournament_id
      t.timestamps
    end
  end
end
