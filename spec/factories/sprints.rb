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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sprint do
    title         "Sprint"
    start_date    '2014-5-21'
    total_points  Random.new.rand(10...30)
  end
end


