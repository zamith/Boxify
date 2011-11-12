class Box < ActiveRecord::Base
  belongs_to :warehouse
  has_many :items
  
end
