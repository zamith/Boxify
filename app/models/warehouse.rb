class Warehouse < ActiveRecord::Base
  has_many :boxes 
  belongs_to :user
  
end
