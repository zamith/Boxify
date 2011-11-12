class WarehousesController < ApplicationController
  
  def index
    @warehouses = (current_user) ? current_user.warehouses : []
  end  
  
  def new
    @warehouse = Warehouse.create
    flash[:notice] = "Created Warehouse #{@warehouse.id}"
  end  
  
end
