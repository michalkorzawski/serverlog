class MostPageViews
  def initialize(server_log)
    @server_log = server_log
  end

  def call
    result
  end

  def to_s
    result.map do |key, value|
      "#{key} #{value} visits"
    end.join("\n")
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
