class Events < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :home_team
      t.string :away_team
      t.string :venue
      t.datetime :date

      t.timestamps
    end
  end
end
