class BoxesController < ApplicationController
  
  def qrCode
    @box = Box.find(params[:box_id])
    @warehouse = Warehouse.find params[:warehouse_id]
    @box.create_qr_code(warehouse_box_url(@warehouse,@box))
  end  
  
  def show
    @box = Box.find params[:id]
    @warehouse = Warehouse.find params[:warehouse_id]
    @items = @box.items
    @item = Item.new
    render "items/new"
  end  
  
  def new
    @warehouse = Warehouse.find params[:warehouse_id]
    @box = Box.new
    @search = Box.search do
        fulltext params[:search]
      end  
    if params[:search]  
      @boxes = @search.results 
    else
      @boxes = []
    end    
  end
  
  def create
    @warehouse = Warehouse.find params[:warehouse_id]
    @boxes = @warehouse.boxes
    @box = Box.new params[:box]
    @box.warehouse = @warehouse
    if @box.save
      flash[:notice] = "Yey, a box!"
      redirect_to new_warehouse_box_item_path(@warehouse,@box)    
    else
      flash[:error] = "Out of carton..."
      render :new
    end
  end  
end
