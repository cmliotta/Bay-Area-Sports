class Games < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :home_team
      t.string :away_team
      t.string :venue
      t.datetime :date
      t.integer :team_id

      t.timestamps
    end
  end
end
