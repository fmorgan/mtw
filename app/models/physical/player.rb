class Player < ActiveRecord::Base
  validates :full_name, :position, :team, :presence => true
end
