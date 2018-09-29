class Section < ActiveRecord::Base
  belongs_to :page

  acts_as_list scope: :page

  KINDS = %w(Snippet Text)
end