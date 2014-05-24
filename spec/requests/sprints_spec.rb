require 'spec_helper'

describe "Sprints", :type => :request do
  describe "GET /sprints" do
    it "works! (now write some real specs)" do
      get sprints_path
      expect(response.status).to be(200)
    end
  end
end
