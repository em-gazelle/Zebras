class Post < ActiveRecord::Base
	attr_accessible :text, :title
end

class Post < ActiveRecord::Base
	validates :title, presence: true, length: {minimum: 3}
end