module Paingain::AdminAuthentication
  def authenticate
    return if user_signed_in? && current_user.role == 'admin'
    flash[:danger] = 'You must be an admin.'
    redirect_to new_user_session_path
  end
end
