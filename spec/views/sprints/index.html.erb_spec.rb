require 'spec_helper'

describe "sprints/index", :type => :view do
  before(:each) do
    assign(:sprints, [
      create(:sprint, title: 'Title', total_points: 1),
      create(:sprint, title: 'Title', total_points: 1)
    ])
  end

  it "renders a list of sprints" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
