class Comment < ActiveRecord::Base
	validates_presence_of :author, :content
	belongs_to :article

	# callback
	after_validation do |c|
		c.author.upcase!
	end
end
