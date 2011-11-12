class Item < ActiveRecord::Base
  belongs_to :box
  belongs_to :category
  
end
