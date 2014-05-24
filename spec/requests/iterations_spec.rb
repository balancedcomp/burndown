require 'spec_helper'

describe "Iterations", :type => :request do
  describe "GET /iterations" do
    it "works! (now write some real specs)" do
      get iterations_path
      expect(response.status).to be(200)
    end
  end
end
