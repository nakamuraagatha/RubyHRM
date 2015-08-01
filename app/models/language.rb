class Language < ActiveRecord::Base
	self.primary_key = "language_code"

	has_many :users, class_name: "User", foreign_key: "locale"
end
