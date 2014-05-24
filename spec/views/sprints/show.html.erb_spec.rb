require 'spec_helper'

describe "sprints/show", :type => :view do
  before(:each) do
    @sprint = assign(:sprint, Sprint.create!(
      :title => "Title",
      :total_points => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
  end
end
