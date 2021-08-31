class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :user_id
      t.string :title
      t.string :text
      t.datetime :created_at
    end
  end
end
