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
	attr_accessor :remember_token
	class << self
		def User.digest string
			cost = if ActiveModel::SecurePassword.min_cost
				BCrypt::Engine::MIN_COST
				else
					BCrypt::Engine.cost
				end
					BCrypt::Password.create string, cost: cost
				end
		
		def new_token
			SecureRandom.urlsafe_base64
		end
	end
	def remember
		self.remember_token = User.new_token
		update_column :remember_digest, User.digest(remember_token)
	end
	def authenticated? remember_token
		BCrypt::Password.new(remember_digest).is_password? remember_token
	end

	def forget
		update_column :remember_digest, nil
	end
	private
	def downcase_email
		email.downcase!
	end

end
