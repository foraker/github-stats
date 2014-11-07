require 'rails_helper'

RSpec.describe Repository, type: :model do
  it { should validate_presence_of :github_id }
  it { should validate_uniqueness_of :github_id }

  it { should have_many :pull_requests }
  it { should have_many(:comments).through(:pull_requests) }
end
