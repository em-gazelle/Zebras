class Comment < ActiveRecord::Base
=begin	(I think these were mistakes, meant for post.rb)
has_many :comments
	validates :title, presence: true,
	length: {minimum: 3}
=end
	belongs_to :post
	attr_accessible :body, :commenter
end
