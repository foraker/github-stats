class GithubUser < ActiveRecord::Base
  validates :login, :github_id, presence: true, uniqueness: true

  has_many :comments
  has_many :pull_requests

  def self.alphabetized
    order("lower(#{table_name}.login)")
  end

  def self.ordered_by_comment_count
    order("#{table_name}.comments_count desc")
  end

  def self.ordered_by_pull_request_count
    order("#{table_name}.pull_requests_count desc")
  end

  def name
    login
  end
end
