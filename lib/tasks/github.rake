namespace :github do
  desc "Import everything from github"
  task import: :environment do
    GithubWrapper::Import.import
  end
end
