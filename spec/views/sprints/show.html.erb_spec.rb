require 'spec_helper'

describe "sprints/show", :type => :view do
  before(:each) do
    @sprint = assign(:sprint, create(:sprint))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
  end
end
