class Section < ActiveRecord::Base
  belongs_to :page
  has_many :photos, :as => :imageable, :dependent => :destroy

  acts_as_list scope: :page

  accepts_nested_attributes_for :photos, :allow_destroy => true

  before_update :remove_content, :remove_photos

  validate :presence_of_content_or_photos

  KINDS = %w(Photo Snippet Text Posts)

  private

  def remove_content
    return unless kind == 'Photo'
    self.content = nil
  end

  def remove_photos
    return unless kind == 'Snippet' || kind == 'Text'
    self.photos.map(&:remove_image!)
    self.photos.map(&:save)
  end

  def presence_of_content_or_photos
    return if self.content.present? || self.photos.any? || self.kind == 'Posts'
    errors.add(:base, 'Please add some text, a snippet, a photo, or posts')
  end
end
