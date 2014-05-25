# == Schema Information
#
# Table name: sprints
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  total_points :integer
#  start_date   :date
#  created_at   :datetime
#  updated_at   :datetime
#

class Sprint < ActiveRecord::Base
  validates :title, :start_date, :total_points, presence: true
  has_many :iterations, :dependent => :destroy
  
  
  
  
  def total_points_completed
    iterations.sum(:points_completed).to_f
  end
  
  def points_remaining
    total_points - total_points_completed
  end
  
  
  
  
  
  
  #HOOKS/CALLBACKS
  
  before_create :add_iterations
  before_update :adjust_iterations

  def adjust_iterations
    if self.total_points_changed?
      
      new_points = self.total_points_change[1]
      old_points = self.total_points_change[0]
      adjustment = new_points-old_points
      
      if adjustment > 0
        add_iterations(adjustment)
      elsif adjustment < 0
        remove_iterations(adjustment.abs)
      end
    
    end
  end
  
  
  def add_iterations(i = total_points)
    i.times do
      iterations.build()
    end
  end
  
  def remove_iterations(i)
    i.times do
      iterations.last.destroy
    end
  end

  
  
  def check_to_see_if_we_need_to_create_or_destory_iterations
    if self.total_points_changed?
      points_difference = self.total_points_change[1]-self.total_points_change[0]
      put points_difference
      #create_iterations(total_points_change_difference)
    end
  end

  
end
