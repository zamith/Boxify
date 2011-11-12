class ItemsController < ApplicationController
  
  def show
    @item = Item.find params[:id]
    @box = Box.find params[:box_id]
    @warehouse = Warehouse.find params[:warehouse_id]
  end  
  
  def new
    @box = Box.find params[:box_id]
    @warehouse = Warehouse.find params[:warehouse_id]
    @items = @box.items
    @item = Item.new 
  end  
  
  def create
    @box = Box.find params[:box_id]
    @warehouse = Warehouse.find params[:warehouse_id]
    @items = @box.items
    @item = Item.create params[:item]
    @item.box = @box
    if @item.save
      flash[:notice] = "Filling the little boxes"
      render :new
    else
      flash[:error] = "Oh noes!"
      render :new
    end    
  end  
  
end
