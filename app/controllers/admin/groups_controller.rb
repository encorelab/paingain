class Admin::GroupsController < Comfy::Admin::Cms::BaseController
  before_action :build_group,  :only => [:new, :create]
  before_action :load_group,   :only => [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def show
    render
  end

  def new
    render
  end

  def edit
    render
  end

  def create
    @group.save!
    flash[:success] = 'Group created'
    redirect_to :action => :index
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Failed to create Group'
    render :action => :new
  end

  def update
    @group.update_attributes!(group_params)
    flash[:success] = 'Group updated'
    redirect_to :action => :show, :id => @group
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Failed to update Group'
    render :action => :edit
  end

  def destroy
    @group.destroy
    flash[:success] = 'Group deleted'
    redirect_to :action => :index
  end

protected

  def build_group
    @group = Group.new(group_params)
  end

  def load_group
    @group = Group.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Group not found'
    redirect_to :action => :index
  end

  def group_params
    params.fetch(:group, {}).permit!
  end
end
