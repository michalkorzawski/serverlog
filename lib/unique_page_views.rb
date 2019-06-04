class UniquePageViews
  def initialize(server_log)
    @server_log = server_log
  end

  def call
    result
  end

  def to_s
    puts 'unique page views:'

    result.each do |key, value|
      puts "#{key} #{value} unique views"
    end
  end

  private

  def uniq_set
    set = Set.new

    @server_log.each.with_object(set) do |line|
      set.add(line.split(' '))
    end
  end

  def count_uniq_views
    hash = Hash.new(0)

    uniq_set.each.with_object(hash) do |entity_arr|
      hash[entity_arr[0]] += 1
    end
  end

  def result
    @result ||= count_uniq_views.sort_by {|key, value| value}.reverse.to_h
  end
end
