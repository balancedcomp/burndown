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
#  icon         :string(255)
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


  def burn_date
    total_points.business_days.after(start_date)
  end

  def actual_date
    points_remaining.to_i.business_days.after(Date.today-1)
  end

  def on_time?
    actual_date == burn_date
  end

  def early?
    actual_date < burn_date
  end

  def late?
    actual_date > burn_date
  end

  def started?
    start_date >= Date.today
  end

  #HOOKS/CALLBACKS

  before_create :populate_iterations
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

  def populate_iterations
    total_points.times do |i|
      iterations.build(:date => i.business_days.after(start_date))
    end
  end

  def add_iterations(i = total_points)
    if iterations.any?
      last_iteration_date = iterations.last.date
      i.times do
        iterations.build(:date => i.business_days.after(last_iteration_date))
      end
    else
      populate_iterations
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
