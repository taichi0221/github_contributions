class CalendarController < ApplicationController
  include HTTParty

  def index
    @contributions = fetch_github_contributions
  end

  private

  def fetch_github_contributions
    # ここにあなたのGitHubユーザー名を入力してください
    github_username = "taichi0221"
    url = "https://github-contributions-api.now.sh/v1/#{github_username}"
  
    response = self.class.get(url)
    parsed_response = JSON.parse(response.body)
    puts parsed_response.inspect # デバッグ用の出力
    return parsed_response["contributions"]
  end
  
end
