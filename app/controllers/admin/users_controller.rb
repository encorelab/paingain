class Admin::UsersController < Comfy::Admin::Cms::BaseController
  def index
    @users = User.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destory
  end
end
