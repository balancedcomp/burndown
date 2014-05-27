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
  
  it 'poplulates iterations with correct dates' do
    sprint = create(:sprint)
    first_iteration = sprint.iterations.first
    expect(first_iteration.date).to eql(sprint.start_date)
  end
  
  it 'populates added/adjusted iterations with correct dates' do
    sprint = create(:sprint)
    last_iteration = sprint.iterations.last
    sprint.add_iterations(1)
    sprint.save
    newest_iteration = sprint.iterations.last
    expect(newest_iteration.date).to eql(last_iteration.date+1.day)
  end
    

end
