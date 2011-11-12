class Box < ActiveRecord::Base
  belongs_to :warehouse
  has_many :items
    
  validates_presence_of :description
  validates_length_of :description, :maximum => 140
  
  searchable do
    text :description, :boost => 5
    text :items do items.map(&:name) + items.map(&:description) end
  end
  
  def create_qr_code(path)
    text = "Box: #{self.id}\n#{path}"
    qrcode = QREncoder.encode(text)
    qrcode.png(:pixels_per_module => 15).save("public/box#{self.id}.png")
  end  
  
end
