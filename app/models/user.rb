class User < ApplicationRecord
	before_save :downcase_email
	scope :newest, -> { order(created_at: :desc) }
	validates :name, presence: true,
                   length: { minimum: 2, maximum: 50 }
    validates :password, presence: true,length: {minimum: Settings.digits.digit_6}, allow_nil: true
  # Validation cho email
  	validates :email, presence: true,
                    format: { with: Regexp.new(Settings.regex.email) },
                    uniqueness: true
	has_secure_password
	attr_accessor :remember_token, :activation_token, :reset_token
	before_save :downcase_email
	before_create :create_activation_digest
	has_many :microposts
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
	def feed
		microposts
	end
	def password_reset_expired?
		reset_sent_at < Settings.digits.digit_2.hours.ago
	end
	def create_reset_digest
		self.reset_token = User.new_token
		update_columns reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now
	end

	def send_password_reset_email
		UserMailer.password_reset(self).deliver_now
	end

	def remember
		self.remember_token = User.new_token
		update_column :remember_digest, User.digest(remember_token)
	end

	def authenticated? attribute, token
		digest = send "#{attribute}_digest"
		return false unless digest
		BCrypt::Password.new(digest).is_password? token
	end

	def forget
		update_column :remember_digest, nil
	end
	def activate
		update_columns activated: true, activated_at: Time.zone.now
	end

	# Sends activation email.
	def send_activation_email
		UserMailer.account_activation(self).deliver_now
	end

	private
	def downcase_email
		email.downcase!
	end

	def create_activation_digest
		self.activation_token = User.new_token
		self.activation_digest = User.digest(activation_token)
	end
end
