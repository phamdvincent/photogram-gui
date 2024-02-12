class UsersController < ApplicationController
  def index
    @users = User.all
    render({ :template => "users/index"})
  end

  def show
    username = params.fetch("username")
    user_id = User.where({ :username => username}).at(0).id
    @user = User.where({ :id => user_id}).at(0)
    render({ :template => "users/show" })
  end
end
