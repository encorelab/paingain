class Admin::GroupsController < Comfy::Admin::Cms::BaseController
  def index
    @groups = Group.all
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
