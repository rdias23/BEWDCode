class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :link
      t.integer :upvotes, default: 0

      t.timestamps
    end
  end
end
