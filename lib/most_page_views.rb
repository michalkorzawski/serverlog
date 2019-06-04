class MostPageViews
  def initialize(server_log)
    @server_log = server_log.map { |line| line.split(' ') }
  end

  def call
    result
  end

  def to_s
    puts 'list of webpages with most page views:'

    result.each do |key, value|
      puts "#{key} #{value} views"
    end
  end

  private

  def count_page_views
    hash = Hash.new(0)

    @server_log.each.with_object(hash) do |entity_arr|
      hash[entity_arr[0]] += 1
    end
  end

  def result
    @result ||= count_page_views.sort_by {|key, value| value}.reverse.to_h
  end
end
