class AddCountryToPlayer < ActiveRecord::Migration
 def self.up
   add_column :players, :country, :string
 end

 def self.down
   remove_column :players, :country
 end
end
