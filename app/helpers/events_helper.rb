module EventsHelper
  def session_check
    if logged_in?
      render 'partials/logged_in'
    else
      render 'partials/not_logged_in'
    end
  end

  def errors_check
    render './errors' if @user.errors.any?
  end

  def event_state(event)
    if !event.attendees.include?(current_user) && event.date >= Date.today
      link_to 'Attend Event', add_events_attending_path(event, idz: event.id), method: :post, class: ''
    elsif event.attendees.include?(current_user)
      link_to 'Unattend Event', rem_events_attending_path(event, idz: event.id), method: :post, class: ''
    else
      content_tag(:span, 'Passed', class: 'text-danger')
    end
  end

  def signup_cta
    return if logged_in?

    content_tag(:p) do
      link_to 'Sign up now!', signup_path, class: 'btn  btn-primary my-2'
    end
  end
end
