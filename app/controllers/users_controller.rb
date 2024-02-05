class UsersController < ApplicationController
  before_action :load_user, only: [:destroy]

  def index
    if q[:id_in].present?
      @users = User.where(id: q[:id_in])
    else
      scope = User.order(:name)
      scope = scope.where("name like ?", "%#{q[:name_cont]}%") if q[:name_cont].present?
      @user_ids = scope.pluck(:id)
      @preloaded_users = User.where(id: @user_ids.first(10))
    end
  end

  def destroy
    @user.destroy
  end

  private

  def q
    params[:q] || {}
  end

  def load_user
    @user = User.find(params[:id])
  end
end
