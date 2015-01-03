class Team < ActiveRecord::Base
  belongs_to :club
  belongs_to :league
end
