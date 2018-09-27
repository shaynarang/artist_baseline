class CreateSocialFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :social_feeds do |t|
      t.text :snippet
      t.text :extra_script
    end
  end
end
