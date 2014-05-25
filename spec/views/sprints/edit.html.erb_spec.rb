require 'spec_helper'

describe "sprints/edit", :type => :view do
  before(:each) do
    @sprint = assign(:sprint, create(:sprint))
  end

  it "renders the edit sprint form" do
    render

    assert_select "form[action=?][method=?]", sprint_path(@sprint), "post" do

      assert_select "input#sprint_title[name=?]", "sprint[title]"

      assert_select "input#sprint_total_points[name=?]", "sprint[total_points]"
    end
  end
end
