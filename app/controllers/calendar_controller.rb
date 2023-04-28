class CalendarController < ApplicationController
  include HTTParty
  require 'nokogiri'
  require 'open-uri'
  
  def index
    @contributions = fetch_github_contributions
  end

  private
  
  def fetch_github_contributions
    github_username = "taichi0221"
    url = "https://github.com/#{github_username}"

    document = Nokogiri::HTML(URI.open(url))
    contributions = []

    document.css('rect.day').each do |rect|
      date = rect['data-date']
      count = rect['data-count'].to_i
      contributions << { "date" => date, "count" => count }
    end

    return contributions
  end

end
