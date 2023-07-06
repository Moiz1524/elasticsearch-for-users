class UsersController < ApplicationController
  def index
    @total_users_count = User.count
    @pagy, @users = pagy(User.all)
  end
end
