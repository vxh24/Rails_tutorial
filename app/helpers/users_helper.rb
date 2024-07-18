module UsersHelper
	# Returns the Gravatar for the given user.
	def gravatar_for (user, options = {size: Settings.digits.digit_80})
		gravatar_id = Digest::MD5::hexdigest user.email.downcase
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		image_tag gravatar_url, alt: user.name, class: "gravatar"
	end
	def can_destroy_user? user
		current_user.admin? && !current_user?(user)
	end
end
