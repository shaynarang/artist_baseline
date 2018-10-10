class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :imageable, :polymorphic => true

  validates_presence_of :image
end
