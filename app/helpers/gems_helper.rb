module GemsHelper
  
  def show_delete_gem_version name
    link_to "Remove", "/gems/#{name}", :confirm => 'Are you sure?', :method => :delete
  end
end
