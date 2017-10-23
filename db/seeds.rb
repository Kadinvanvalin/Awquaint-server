# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Invitation.destroy_all
kara = User.create!(name:"Squiggles", email: "Squiggles@sqee.com", interest: "La Croix", password: "password")
Kathiee = User.create!(name:"Kathiee", email: "Kathiee@sqee.com", interest: "Snacks", password: "password")
nicole = User.create!(name:"nicole", email: "nicole@sqee.com", interest: "The color purple", password: "password")
kadin = User.create!(name:"kadin", email: "kadin@sqee.com", interest: "dead things", password: "password")

kadinInvKara = Invitation.new(accepted: "pending")
kadin.sent_invitations << kadinInvKara
kara.received_invitations << kadinInvKara


