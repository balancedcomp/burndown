# == Schema Information
#
# Table name: iterations
#
#  id               :integer          not null, primary key
#  date             :date
#  points_completed :decimal(, )
#  sprint_id        :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Iteration < ActiveRecord::Base
  belongs_to :sprint
  
  default_value_for :points_completed, nil

end
