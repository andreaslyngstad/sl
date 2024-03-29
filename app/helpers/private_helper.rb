module PrivateHelper
	def every_day_log_hour(log_week_project, date, project)
		hours = log_week_project.detect { |key| key[0][0].to_i == project.id && key[0][1].to_time.strftime('%a') == date.to_time.strftime('%a')}
		hours ? time_diff(hours[1]) : "<span style='color:grey;'>0:00</span>".html_safe
	end
	def every_day_log_hour_no_project(log_week_project, date)
    hours = log_week_project.detect { |key| key[0].to_time.strftime('%a') == date.to_time.strftime('%a')} if log_week_project
    hours ? time_diff(hours[1]) : "<span style='color:grey;'>0:00</span>".html_safe
  end
	def every_day_log_hour_total(log_week, date)
		hours = log_week.detect { |key,v| key.to_time.strftime('%a') == date.to_time.strftime('%a')}
		hours ? time_diff(hours[1]) : "<span style='color:grey;'>0:00</span>".html_safe
	end
	def project_week_log_hour_total(log_project, project)
		hours = log_project.detect { |key,v| key.to_i == project.id}
		hours ? time_diff(hours[1]) : "<span style='color:grey;'>0:00</span>".html_safe
	end
	def days_of_week
	  ["Monday","Tuesday","Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
	end
	def days_in_month(year, month)
	  last_day = (Date.new(year, 12, 31) << (12-month))
	  last_day.beginning_of_month..last_day
	end
  
end
