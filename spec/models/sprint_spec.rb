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

require 'spec_helper'

describe Sprint, :type => :model do

  it 'creates iterations when created' do
    sprint = create(:sprint)
    expect(sprint.iterations.size).to eql(sprint.total_points)
  end

  it 'adjusts its iterations when total_points is updated' do
    sprint = create(:sprint)
    expect(sprint.iterations.size).to eql(sprint.total_points)
    
    sprint.update_attribute(:total_points, sprint.total_points+5)
    expect(sprint.iterations.size).to eql(sprint.total_points)

    sprint.update_attribute(:total_points, sprint.total_points-10)
    expect(sprint.iterations.size).to eql(sprint.total_points)

  end
  
  it 'deletes its iterastion when deleted' do
    sprint = create(:sprint)
    expect(Iteration.all.size).to eql(sprint.total_points)
    
    sprint.destroy
    expect(Iteration.all.size).to eql(0)
  end
  
    

end
