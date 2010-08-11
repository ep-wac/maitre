class GemsController < ApplicationController
  
  respond_to :html, :js, :xml, :json
  
  def show
    #require 'httparty' # sudo gem install httparty
    @gem = HTTParty.get("http://rubygems.org/api/v1/gems/#{params[:id]}.json").parsed_response
    #@gem = `curl http://rubygems.org/api/v1/gems/#{params[:id]}.json`
    respond_with(@gem)
  end
    
  def new
    @gem = Gem.new
  end
  
  def edit
    @gem = `gem update #{params[:id]} --no-rdoc --no-ri`
    @gem = @gem.split("\n").unshift
    respond_with(@gem)
  end
    
  
  def create
    `gem install #{params[:gem][:title]} --no-rdoc --no-ri`
    redirect_to gems_url
  end
  
  def index
    @gems = `gem list`
  end
  
  def destroy
    `gem uninstall #{params[:id]} -a`
    redirect_to gems_url
  end
  
end
