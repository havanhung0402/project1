# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(name: "Hoa",
#              email: "hoabuisla123@gmail.com",
#              address: "Son la",
#              phone: "0163688099",
#              birthday: "3/27/1996",
#              password: "daigaoi1",
#              password_confirmation: "daigaoi1",
#              admin: true)
# users = User.order(:created_at).take(6)


13.times do |course|
  title = "Tiếng anh giao tiếp"
  content = "Luyện phát âm chuẩn toàn bộ 44 âm trong bài phiên âm quốc tế 
		         (Bảng IPA).Phát triển khả năng nghe và nhận biết âm thanh chuẩn qua các bài 
			       tập luyện nghe. Sử dụng nối âm, biến âm, ngữ điệu lên xuống một cách 
			       tự nhiên nhất. Sử dụng các câu cụm trong giao tiếp mà người bản xứ hay sử dụng, 
			       những câu cụm không thể tìm thấy trong sách vở"
  image = 0
  user_id = 1
  price = 999000
  Course.create! title: title, content: content, image: image,
	  			       user_id: 1, price: price
end
