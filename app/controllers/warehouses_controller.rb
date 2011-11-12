class WarehousesController < ApplicationController
  
  def index
    @warehouses = (current_user) ? current_user.warehouses : []
  end  
  
  def new
    @warehouse = Warehouse.create :user => current_user
    flash[:notice] = "Created Warehouse #{@warehouse.id}"
    redirect_to new_warehouse_box_path(@warehouse)
  end  
  
  def show
    @warehouse = Warehouse.find params[:id]
    @box = Box.new
    @boxes = @warehouse.boxes
    render "boxes/new"
  end  
  
end
