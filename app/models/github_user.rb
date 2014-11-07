class GithubUser < ActiveRecord::Base
  validates :login, :github_id, presence: true, uniqueness: true

  has_many :comments
  has_many :pull_requests

  def self.alphabetized
    order(:login)
  end
end
