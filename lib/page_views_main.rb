class PageViewsMain
  def initialize(server_log)
    @server_log = server_log
  end

  def call
    result
  end

  def formatted_string(type)
    result.map do |key, value|
      "#{key} #{value} #{type}"
    end.join("\n")
  end

  private

  def count_views(collection)
    collection.each.with_object(Hash.new(0)) do |entity_arr, hash|
      hash[entity_arr[0]] += 1
    end
  end

  def result
    count_views(collection).sort_by {|key, value| value}.reverse.to_h
  end
end
