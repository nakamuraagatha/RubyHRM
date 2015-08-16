class Dependent < ActiveRecord::Base
	belongs_to :person

	validates :name, presence: true
end
