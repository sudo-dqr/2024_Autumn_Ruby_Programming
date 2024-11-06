# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
admin_role = Role.find_or_create_by!(name: 'admin')
user_role = Role.find_or_create_by!(name: 'user')

admin_email = 'admin@example.com'
unless User.exists?(email: admin_email)
  User.create!(
    name: 'Admin',
    email: admin_email,
    password: 'password',
    password_confirmation: 'password',
    role: admin_role
  )
end