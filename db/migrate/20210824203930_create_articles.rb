class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :user_name
      t.string :title
      t.string :text
      t.image :image
      t.datetime :created_at

      t.timestamps
    end
  end
end
