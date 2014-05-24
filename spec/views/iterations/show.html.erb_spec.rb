require 'spec_helper'

describe "iterations/show", :type => :view do
  before(:each) do
    @iteration = assign(:iteration, Iteration.create!(
      :points_completed => "9.99",
      :sprint_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/1/)
  end
end
