class PullRequest < ActiveRecord::Base
  include RemoteTimestamps

  belongs_to :repository
  belongs_to :github_user, counter_cache: true

  has_many :comments

  validates :github_id, presence: true, uniqueness: true

  def self.from_github_user(user)
    where(github_user_id: user)
  end

  def self.for_repository(repository)
    where(repository_id: repository)
  end
end
