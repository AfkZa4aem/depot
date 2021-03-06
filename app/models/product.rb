class Product < ActiveRecord::Base
  # check title, description, image and price - not empty
  validates :title, :description, :image_url, presence: true
  # set price >= 0.01
  validates :price, numericality: {greater_then_or_equal_to: 0.01}
  # check title uniq
  validates :title, uniqueness: true
  # check image format (gif, jpg, png allowed)
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  # validates :description, length: { minimum: 10},
  validates_length_of :description, minimum: 10, 
                      message: "Description is too small. 10 characters min."

  def self.latest
    Product.order(:updated_at).last
  end
end
