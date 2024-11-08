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

user_email = 'dqr@example.com'
unless User.exists?(email: user_email)
    User.create!(
      name: 'dqr',
      email: user_email,
      password: 'dqr',
      password_confirmation: 'dqr',
      role: user_role
    )

Product.create!(
  name: '计算机组成原理',
  description: '计算机组成原理是计算机体系结构中重要的基础课程, 在大二上学期开设',
  price: 70,
  sales: 0
)    

Product.create!(
  name: '现代操作系统',
  description: '操作系统是建立在计算机组成原理之上的计算机基础课程, 在大二下学期开设',
  price: 75,
  sales: 0
)

end  
end