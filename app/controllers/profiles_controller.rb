class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [ :show, :edit, :update ]

  def show
   @user = current_user #shows if the current user is present 
   @post = @user.posts # shows the posts created by the current user 
    if @profile.nil?
      redirect_to new_profile_path, alert: "Please create your profile first"
    end
  end

  def new
    if current_user.profile.present?
      redirect_to edit_my_profile_path, alert: "You already have a profile"
    else
      @profile = current_user.build_profile
    end
  end

  def create
    @profile = current_user.build_profile(profile_params)

    if @profile.save
      flash[:success] = "Profile successfully created"
      redirect_to my_profile_path
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to my_profile_path, notice: "Profile updated"
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:bio)
  end
end
