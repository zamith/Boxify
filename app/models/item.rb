class Item < ActiveRecord::Base
  belongs_to :box
  belongs_to :category
  
  validates_numericality_of :quantity, 
      :greater_than_or_equal_to =>0, 
      :only_integer => true
  
end
