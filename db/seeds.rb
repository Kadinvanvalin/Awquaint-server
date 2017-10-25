# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Invitation.destroy_all

kadin = User.create(name: "kadin", email: "kadin@email.com", password: "password", interest: "javascript")
kara = User.create(name: "kara", email: "squiggles@email.com", password: "password", interest: "La Croix")
kathiee = User.create(name: "kathiee", email: "kathiee@email.com", password: "password", interest: "snacking")
nicole = User.create(name: "nicole", email: "nicole@email.com", password: "password", interest: "crockpot")
karl = User.create(name: "karl", email: "karl@email.com", password: "password", interest: "dancing",longitude: 87.45345, latitude: -77.234235)

invite_1 = Invitation.create(accepted: "pending")
invite_2 = Invitation.create(accepted: "accepted")
invite_3 = Invitation.create(accepted: "declined")

kara.sent_invitations << invite_1
kadin.received_invitations << invite_1
kathiee.sent_invitations << invite_2
kara.received_invitations << invite_2
karl.sent_invitations << invite_3
kadin.received_invitations << invite_3
