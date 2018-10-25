class Site < ActiveRecord::Base
  has_many :photos, :as => :imageable, :dependent => :destroy
  has_many :themes

  accepts_nested_attributes_for :photos, :allow_destroy => true
  accepts_nested_attributes_for :themes, :allow_destroy => true

  validates_presence_of :title
end