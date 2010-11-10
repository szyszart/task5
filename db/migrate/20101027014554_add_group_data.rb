class AddGroupData < ActiveRecord::Migration
  def self.up
	Group.delete_all
	Group.create(:name => 'default')
	Group.create(:name => 'funny')
	Group.create(:name => 'stupid')
  end

  def self.down
	Group.delete_all
  end
end
