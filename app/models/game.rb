class Game < ActiveRecord::Base
  belongs_to :team
  has_many :comments
end
