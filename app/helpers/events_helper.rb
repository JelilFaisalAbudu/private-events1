module EventsHelper
  def session_check
    if logged_in?
      render 'shared/logged_in'
    else
      render 'shared/not_logged_in'
    end
  end

  def errors_check
    render './errors' if @user.errors.any?
  end
end
