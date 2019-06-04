require_relative 'page_views_main'

class MostPageViews < PageViewsMain
  def to_s
    formatted_string('visits')
  end

  private

  def collection
    @server_log
  end
end
