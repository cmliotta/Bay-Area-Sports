class Rosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.string :player_name
      t.string :player_number

      t.timestamps
    end
  end
end
