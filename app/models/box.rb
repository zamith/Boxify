class Box < ActiveRecord::Base
  belongs_to :warehouse
  has_many :items
    
  validates_presence_of :description
  validates_length_of :description, :maximum => 140
  
  searchable do
    text :description, :boost => 5
    text :items do items.map(&:name) + items.map(&:description) end
  end
  
  def create_qr_code
    p "Hello"
  end  
  
end
