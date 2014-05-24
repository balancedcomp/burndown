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
  it 'should create iterations when created' do
  
  end

end
