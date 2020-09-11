# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  AdminUser.find_or_create_by(
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password'
  )
end

Site.find_or_create_by(title: 'Your Site')

Page.find_or_create_by(title: 'News')

Page.find_or_create_by(title: 'Contact')

Theme.find_or_create_by(
  site: Site.last.id,
  font_url: "https://fonts.googleapis.com/css?family=Arvo|Raleway|Roboto+Mono|Russo+One|Unlock",
  nav_background_color: "black",
  nav_text_color: "mintcream",
  main_background_color: "mintcream",
  content_text_color: "black",
  border_color: "black", published: true,
  font_family: "Roboto Mono",
  title_font_url: "https://fonts.googleapis.com/css?family=Arvo|Raleway|Roboto+Mono|Russo+One|Unlock",
  title_font_family: "Roboto Mono"
)
