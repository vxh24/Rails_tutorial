class TestMigrate < ActiveRecord::Migration[7.0]
  	def up
  		5.times do |i|
  			User.create(
  			name: "User ##{i}", 
  			email: "user_#{i}@gmail.com")
  		end
  	end
  	def down 
  		User.delete_allendend
  	end
end
