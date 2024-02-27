module ApplicationHelper
    def formatted_timestamp(timestamp)
      timestamp.strftime('%A, %B %e, %Y at %l:%M %P')
    end
end
