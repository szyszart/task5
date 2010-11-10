class Article < ActiveRecord::Base
	belongs_to :group

	validates_presence_of :title, :content
	has_many :comments, :dependent => :destroy

	def self.per_page
		2
	end

        def get_group_name
                group = Group.find(group_id)
                if group.nil?
                        "unassigned"
                else
                        group.name
                end
        end

	def get_author_name
		Admin.find(author_id).email
	end
end
