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

require 'spec_helper'

describe Iteration, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
