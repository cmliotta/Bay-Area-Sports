class Players < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :number
      t.integer :team_id

      t.timestamps
    end
  end
end
