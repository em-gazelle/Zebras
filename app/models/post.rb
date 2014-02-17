class Post < ActiveRecord::Base
	has_many :comments
	validates :title, presence: true, length: {minimum: 3}

	attr_accessible :text, :title
end