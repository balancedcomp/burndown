require 'spec_helper'

describe "iterations/edit", :type => :view do
  before(:each) do
    @iteration = assign(:iteration, Iteration.create!(
      :points_completed => "9.99",
      :sprint_id => 1
    ))
  end

  it "renders the edit iteration form" do
    render

    assert_select "form[action=?][method=?]", iteration_path(@iteration), "post" do

      assert_select "input#iteration_points_completed[name=?]", "iteration[points_completed]"

      assert_select "input#iteration_sprint_id[name=?]", "iteration[sprint_id]"
    end
  end
end
