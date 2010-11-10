class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.integer :group_id
      t.column :title, :string
      t.column :content, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
