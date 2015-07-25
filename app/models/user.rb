class User < ActiveRecord::Base
	has_secure_password

	belongs_to :person

	validates :username, presence: true
	validates_uniqueness_of :username

	before_create { generate_token(:auth_token)}

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])

	end

	def send_password_reset
		generate_token(:password_reset_token)
		self.password_reset_sent_at = Time.zone.now
		save!
		UserMailer.password_reset(self).deliver
	end

	def employee?
		self.role == 'employee'
	end

	def manager?
		self.role == 'manager'
	end

	def admin?
		self.role == 'admin'
	end

	private
		def self.search(query)
			where("username ILIKE ? OR role ILIKE ?", "%#{query}%", "%#{query}%")
		end
end
