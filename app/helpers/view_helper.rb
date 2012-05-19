module ViewHelper
  def past_time(time)
    "#{distance_of_time_in_words(Time.now, time)} ago"
  end
  
  def brand_title
    (@current_account.nil? ? "ngerental.com" : "#{@current_account.name}")
  end
end