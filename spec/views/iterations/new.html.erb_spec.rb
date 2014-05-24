require 'spec_helper'

describe "iterations/new", :type => :view do
  before(:each) do
    assign(:iteration, Iteration.new(
      :points_completed => "9.99",
      :sprint_id => 1
    ))
  end

  it "renders new iteration form" do
    render

    assert_select "form[action=?][method=?]", iterations_path, "post" do

      assert_select "input#iteration_points_completed[name=?]", "iteration[points_completed]"

      assert_select "input#iteration_sprint_id[name=?]", "iteration[sprint_id]"
    end
  end
end
