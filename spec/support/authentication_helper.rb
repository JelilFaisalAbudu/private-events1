module AuthenticationHelper
  def sign_in(user)
    login(user)
  end

  def login(user)
    user = User.find(user.id)
    request.session[:current_user_id] = user.id
  end

  def current_user
    User.find(request.session[:current_user_id])
  end
end
