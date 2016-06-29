class Place < ActiveRecord::Base
	belongs_to :user
	# used to be --> validates :name, presence: true
	validates :name, :address, :description, presence: true
	validates :name, length: { minimum: 3, :allow_blank => true , too_short: "Name must have at least 3 characters!" }

    # alternative
    #validates :name, presence: true, length: { minimum: 3, :allow_blank => true , too_short: "Name must have at least 3 characters!" }
    #validates :address, :description, presence: true
end
