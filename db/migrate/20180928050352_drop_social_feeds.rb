class DropSocialFeeds < ActiveRecord::Migration[5.2]
  def change
    drop_table :social_feeds
  end
end
