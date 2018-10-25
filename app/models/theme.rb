class Theme < ActiveRecord::Base
  belongs_to :site

  validates_presence_of :name
  before_save :unpublish_theme

  scope :published, -> { where(published: true) }

  private

  def unpublish_theme
    # if a theme has newly been marked as published
    # we need to unmark any old published theme
    return unless self.published
    published_themes = self.site.themes.published
    published_themes[0].toggle!(:published) if published_themes.any?
  end
end