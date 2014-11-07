class Repository < ActiveRecord::Base
  validates :github_id, presence: true, uniqueness: true

  has_many :pull_requests
  has_many :comments, through: :pull_requests

  def self.alphabetized
    order(:name)
  end

  def self.with_id(id)
    where(id: id)
  end
end
