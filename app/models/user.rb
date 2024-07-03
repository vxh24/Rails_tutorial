class User < ApplicationRecord
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	before_save :downcase_email
	validates :name, presence: true,
                   length: { minimum: 2, maximum: 50 }

  # Validation cho email
  	validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true 
	has_secure_password
	private
	def downcase_email
		email.downcase!
	end
end
