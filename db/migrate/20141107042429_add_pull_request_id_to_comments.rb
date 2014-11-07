class AddPullRequestIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :pull_request_id, :integer, index: true
  end
end
