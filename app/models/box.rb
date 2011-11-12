class Box < ActiveRecord::Base
  belongs_to :warehouse
  has_many :items
  
  validates_presence_of :description
  
end
