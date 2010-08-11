require 'spec_helper'

describe GemsController do

  describe "POST create" do 
    it "creates a new gem" 
    it "saves the gem" 
  end 
    
  it "creates a new gem" do 
    Gem.should_receive(:new).with("title" => "a new gem") 
    post :create, :gem => { "title" => "a new gem" } 
  end 

end
