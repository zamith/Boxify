class BoxesController < ApplicationController
  
  def index
    @user_boxes = current_user.warehouses
  end  
  
  def show
    @box = Box.find params[:box_id]
    @warehouse = Warehouse.find params[:warehouse_id]
  end  
  
  def new
    @warehouse = Warehouse.find params[:warehouse_id]
    @box = Box.new
    @boxes = @warehouse.boxes
  end
  
  def create
    @warehouse = Warehouse.find params[:warehouse_id]
    @boxes = @warehouse.boxes
    @box = Box.new params[:box]
    if @box.save
      flash[:notice] = "Yey, a box!"
      redirect_to new_warehouse_box_item_path(@warehouse,@box)    
    else
      flash[:error] = "Out of carton..."
      render :new
    end
  end  
end
