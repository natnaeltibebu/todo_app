class ApplicationController < ActionController::Base
  before_action :track_visit
  before_action :track_page_visits
  helper_method :time_based_greeting, :time_ago_in_words

  private

  def track_visit
    session[:last_visited] = Time.current
    session[:visit_count] ||= 0
    session[:visit_count] += 1
  end

  def track_page_visits
    session[:page_visits] ||= {}
    current_path = request.path
    session[:page_visits][current_path] ||= 0
    session[:page_visits][current_path] += 1
  end

  def time_based_greeting
    current_hour = Time.current.hour
    case current_hour
    when 5..11 then "Good morning!"
    when 12..16 then "Good afternoon!"
    when 17..20 then "Good evening!"
    else "Good night!"
    end
  end

  def time_ago_in_words(time)
    return "" unless time
    seconds = (Time.current - time).to_i
    
    case seconds
    when 0..59 then "just now"
    when 60..3599
      minutes = (seconds / 60.0).round
      "#{minutes} #{minutes == 1 ? 'minute' : 'minutes'} ago"
    when 3600..86399
      hours = (seconds / 3600.0).round
      "#{hours} #{hours == 1 ? 'hour' : 'hours'} ago"
    else
      days = (seconds / 86400.0).round
      "#{days} #{days == 1 ? 'day' : 'days'} ago"
    end
  end
end