require 'spec_helper'

describe "iterations/index", :type => :view do
  before(:each) do
    assign(:iterations, [
      Iteration.create!(
        :points_completed => "9.99",
        :sprint_id => 1
      ),
      Iteration.create!(
        :points_completed => "9.99",
        :sprint_id => 1
      )
    ])
  end

  it "renders a list of iterations" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
