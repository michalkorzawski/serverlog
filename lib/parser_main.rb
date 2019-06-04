require_relative 'most_page_views'
require_relative 'unique_page_views'

class ParserMain
  def initialize(server_log)
    @server_log = server_log.each.with_object([]) { |line, arr| arr << line.split(' ') }
  end

  def call
    puts 'list of webpages with most page views:'
    puts MostPageViews.new(@server_log).to_s
    puts
    puts 'unique page views:'
    puts UniquePageViews.new(@server_log).to_s
  end
end
