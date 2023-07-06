class UsersController < ApplicationController
  def index
    @total_users_count = User.count
    
    @pagy, @users = params[:query].present? ?
      pagy(User.search(params[:query]).records.records) : pagy(User.all)
  end
end
