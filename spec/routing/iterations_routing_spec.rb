require "spec_helper"

describe IterationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/iterations").to route_to("iterations#index")
    end

    it "routes to #new" do
      expect(:get => "/iterations/new").to route_to("iterations#new")
    end

    it "routes to #show" do
      expect(:get => "/iterations/1").to route_to("iterations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/iterations/1/edit").to route_to("iterations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/iterations").to route_to("iterations#create")
    end

    it "routes to #update" do
      expect(:put => "/iterations/1").to route_to("iterations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/iterations/1").to route_to("iterations#destroy", :id => "1")
    end

  end
end
