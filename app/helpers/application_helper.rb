module ApplicationHelper
  def format_posted_time(time)
    time.strftime("%Y/%m/%d(%a) %H:%M:%S")
  end
end
