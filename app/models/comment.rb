class Comment < ActiveRecord::Base
  include RemoteTimestamps

  validates :github_user, :github_id, presence: true
  validates :github_id, uniqueness: true

  belongs_to :github_user
  belongs_to :pull_request

  has_one :repository, through: :pull_request

  def self.from_github_user(user)
    where(github_user_id: user)
  end

  def self.for_repository(repository)
    joins(:repository).merge(Repository.with_id(repository))
  end
end
