require 'set'

class UniquePageViews
  def initialize(server_log)
    @server_log = server_log
  end

  def call
    result
  end

  def to_s
    result.map do |key, value|
      "#{key} #{value} unique views"
    end.join("\n")
  end

  private

  def uniq_set
    @server_log.each.with_object(Set.new) do |line, set|
      set.add(line)
    end
  end

  def count_uniq_views
    uniq_set.each.with_object(Hash.new(0)) do |entity_arr, hash|
      hash[entity_arr[0]] += 1
    end
  end

  def result
    @result ||= count_uniq_views.sort_by {|key, value| value}.reverse.to_h
  end
end
