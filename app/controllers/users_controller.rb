class UsersController < ApplicationController

  skip_before_filter :require_login

	def show
    	@user = User.find(params[:id])
  end

  def new
    if current_user
      redirect_to '/'
    else
      @user = User.new
    end
  end

  def index
    @user = current_user
    if current_user.admin?
      @users = User.paginate(page: params[:page])
    else
      flash[:error] = "You've no rights for viewing this page"
      redirect_to @user
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
 		   flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if !@user.admin?
      @user.destroy
      flash[:success] = "User deleted."
      redirect_to users_url  
    else
      flash[:success] = "You can't delete the administrator."
      redirect_to users_url
    end

  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
