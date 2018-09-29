class Section < ActiveRecord::Base
  belongs_to :page

  KINDS = %w(Snippet Text)
end