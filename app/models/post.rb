require 'twilio-ruby'

class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true, length: {minimum: 3}

	attr_accessible :text, :title


end