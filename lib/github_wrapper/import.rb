module GithubWrapper
  class Import
    def self.import
      new.import
    end

    def initialize(config = Rails.application.secrets)
      unless config.github_username.present? && config.github_password.present?
        raise 'Please set ENV["GITHUB_USERNAME"] and ENV["GITHUB_PASSWORD"]'
      end

      self.github = Github.new(
        login: config.github_username,
        password: 'cac6f25cfc2deb057e8c11abec65b4babac68189'#config.github_password
      )
    end

    def import
      import_repositories
      import_pull_requests
      import_comments
    end

    private

    attr_accessor :github, :repos

    def import_repositories
      remote_repos = github.repos.list(org: "Foraker", type: :all, auto_pagination: true)
      remote_repos.each do |remote_repo|
        Repository.create_with(
          name:              remote_repo.name,
          private:           remote_repo.private,
          html_url:          remote_repo.html_url,
          url:               remote_repo.url,
          description:       remote_repo.description,
          remote_created_at: remote_repo.created_at,
          remote_updated_at: remote_repo.updated_at
        ).find_or_create_by(github_id: remote_repo.id)
      end
    end

    def import_pull_requests
      Repository.all.each do |repo|
        %w{ open closed }.each do |state|
          github.pull_requests.list(
            user: "Foraker",
            repo: repo.name,
            state: state,
            auto_pagination: true
          ).each do |pr|
            user = GithubUser.create_with(
              login: pr.user.login
            ).find_or_create_by(github_id: pr.user.id)

            PullRequest.create_with(
              repository_id:     repo.id,
              github_user_id:    user.id,
              url:               pr.url,
              number:            pr.number,
              state:             pr.state,
              title:             pr.title,
              body:              pr.body,
              remote_created_at: pr.created_at,
              remote_updated_at: pr.updated_at,
              closed_at:         pr.closed_at,
              merged_at:         pr.merged_at
            ).find_or_create_by(github_id: pr.id)
          end
        end
      end
    end

    def import_comments
      Repository.all.each do |repo|
        github.pull_requests.comments.list(
          user: "Foraker",
          repo: repo["name"],
          auto_pagination: true
        ).each do |remote_comment|
          next unless remote_comment.user.present?

          user = GithubUser.create_with(
            login: remote_comment.user.login
          ).find_or_create_by(github_id: remote_comment.user.id)

          Comment.create_with(
            github_user_id:    user.id,
            url:               remote_comment.url,
            html_url:          remote_comment.html_url,
            body:              remote_comment.body,
            remote_created_at: remote_comment.created_at,
            remote_updated_at: remote_comment.updated_at,
            pull_request_url:  remote_comment.pull_request_url,
            pull_request_id:   PullRequest.find_by_url(remote_comment.pull_request_url).try(:id)
          ).find_or_create_by(github_id: remote_comment.id)
        end
      end
    end
  end
end
