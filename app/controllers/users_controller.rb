class UsersController < ApplicationController
  def index
    @users = User.all
    render({ :template => "users/index"})
  end

  def show
    username = params.fetch("username")
    user_id = User.where({ :username => username}).at(0).id
    @user = User.where({ :id => user_id}).at(0)

    @own_photos = @user.own_photos
    render({ :template => "users/show" })
  end

  def create
    @new_user = User.new
    @new_user.username = params.fetch("input_username")

    if @new_user.valid?
      @new_user.save
      redirect_to("/users", { :notice => "User created successfully." })
    else
      redirect_to("/users", { :notice => "User failed to be created." })
    end
  end
end
