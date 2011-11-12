class BoxesController < ApplicationController
  
  def index
    @user_boxes = current_user.warehouses
  end  
  
  def new
    @box = Box.new
  end
  
  def create
    @box = Box.find params[:id]
  end  
end
