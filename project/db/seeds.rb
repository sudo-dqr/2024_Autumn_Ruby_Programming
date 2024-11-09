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

user_email = 'dqr@example.com'
unless User.exists?(email: user_email)
    User.create!(
      name: 'dqr',
      email: user_email,
      password: 'dqr',
      password_confirmation: 'dqr',
      role: user_role
    )
end

ds = Product.create!(
  name: '数据结构',
  description: '数据结构是计算机专业的重要课程, 在大一下学期开设',
  price: 50,
  sales: 0
)
ds.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'DS.jpg')), filename: 'DS.jpg')

co = Product.create!(
  name: '计算机组成原理',
  description: '计算机组成原理是计算机体系结构中重要的基础课程, 在大二上学期开设',
  price: 70,
  sales: 0
)    
co.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'CO.jpg')), filename: 'CO.jpg')

os = Product.create!(
  name: '现代操作系统',
  description: '操作系统是建立在计算机组成原理之上的计算机基础课程, 在大二下学期开设',
  price: 75,
  sales: 0
)
os.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'OS.jpg')), filename: 'OS.jpg')

cp = Product.create!(
  name: '编译原理',
  description: '编译原理是计算机专业的重要课程, 在大三上学期开设',
  price: 80,
  sales: 0
)
cp.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'CP.jpg')), filename: 'CP.jpg')

al = Product.create!(
  name: '算法设计与分析',
  description: '算法设计与分析是计算机专业的重要课程, 在大三上学期开设',
  price: 60,
  sales: 0
)
al.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'AL.jpg')), filename: 'AL.jpg')

net = Product.create!(
  name: '计算机网络',
  description: '计算机网络是计算机专业的重要课程, 在大三下学期开设',
  price: 45,
  sales: 0
)
net.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'NET.jpg')), filename: 'NET.jpg')