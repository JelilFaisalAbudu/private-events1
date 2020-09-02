module UsersHelper
  def user_activities
    if current_user.created_events.count.zero?
			content_tag(:h2, 'You have not organized any event yet', class: "text-center")
    else
      render 'partials/user_events'
    end
  end
end
