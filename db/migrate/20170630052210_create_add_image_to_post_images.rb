class CreateAddImageToPostImages < ActiveRecord::Migration
  def change
    add_attachment :post_images, :image
  end
end
