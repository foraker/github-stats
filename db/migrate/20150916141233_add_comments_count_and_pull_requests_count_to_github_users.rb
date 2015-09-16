class AddCommentsCountAndPullRequestsCountToGithubUsers < ActiveRecord::Migration
  def change
    add_column :github_users, :comments_count, :integer
    add_column :github_users, :pull_requests_count, :integer
  end
end
