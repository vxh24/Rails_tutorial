class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :load_user, only: %i(edit show update destroy)
  before_action :correct_user, only: %i(edit update )
  before_action :admin_user, only: :destroy
  # GET /users or /users.json
  def index
    @pagy, @users = pagy User.newest, items: Settings.digits.digit_10
  end

  # GET /users/1 or /users/1.json
  def show
    return unless @user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
      if @user.save
        @user.send_activation_email
        flash[:info] = "Please check your email to activate your account."
        redirect_to root_url, status: :see_other
      else
        render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    # respond_to do |format|
      if @user.update(user_params)
        # format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        # format.json { render :show, status: :ok, location: @user }
        flash[:success] = "Profile updated"
        redirect_to user_path
      else
        # format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
        render :edit, status: :unprocessable_entity
      end
    # end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    if @user.destroy
      flash[:success] = "User deleted"
    else
      flash[:danger] = "Delete fail!"
    end
    redirect_to users_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_user
      @user = User.find_by id: params[:id]
      return if @user
      flash[:danger] = "User not found!"
      redirect_to root_url
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
        end
      end
    def correct_user
      return if current_user?(@user)
      flash[:error] = "You cannot edit this account."
      redirect_to root_url
    end
    def admin_user
      redirect_to root_path unless current_user.admin?
    end
end
