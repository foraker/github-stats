class CreatePullRequests < ActiveRecord::Migration
  def change
    create_table :pull_requests do |t|
      t.integer :repository_id, index: true
      t.integer :github_user_id, index: true
      t.string :url
      t.integer :github_id, index: true
      t.integer :number
      t.string :state
      t.string :title
      t.text :body
      t.datetime :remote_created_at
      t.datetime :remote_updated_at
      t.datetime :closed_at
      t.datetime :merged_at

      t.timestamps
    end
  end
end
