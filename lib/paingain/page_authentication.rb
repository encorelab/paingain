module Paingain::PageAuthenication
  def authenticate
    unprotected_paths = ['', 'about']
    return if unprotected_paths.member?(params['cms_path']) || user_signed_in?
    flash[:danger] = 'You must be logged in to view this page.'
    redirect_to new_user_session_path
  end
end
