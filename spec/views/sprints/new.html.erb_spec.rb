require 'spec_helper'

describe "sprints/new", :type => :view do
  before(:each) do
    assign(:sprint, Sprint.new(
      :title => "MyString",
      :total_points => 1
    ))
  end

  it "renders new sprint form" do
    render

    assert_select "form[action=?][method=?]", sprints_path, "post" do

      assert_select "input#sprint_title[name=?]", "sprint[title]"

      assert_select "input#sprint_total_points[name=?]", "sprint[total_points]"
    end
  end
end
