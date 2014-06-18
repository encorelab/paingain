module Paingain::AdminAuthentication
  def authenticate
    unless user_signed_in? && current_user.role == 'admin'
      about 'here'
      flash[:danger] = 'You must be an admin.'
      redirect_to new_user_session_path
    end
  end
end
