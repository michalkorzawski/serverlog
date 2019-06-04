require 'set'
require_relative 'page_views_main'

class UniquePageViews < PageViewsMain
  def to_s
    formatted_string('unique views')
  end

  private

  def collection
    @server_log.each.with_object(Set.new) do |line, set|
      set.add(line)
    end
  end
end
