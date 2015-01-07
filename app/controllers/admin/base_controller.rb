class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only

  def index
    @topics = Topic.all
  end

  private
    def admin_only
      unless current_user.admin?
        redirect_to root_url
      end
    end
end
