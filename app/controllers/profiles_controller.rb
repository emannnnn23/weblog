class ProfilesController < ApplicationController
  before_action :set_profile, only[:show]

  def show
    
  end


  def def new
   if current_user.profile.present?
     redirect_to edit_profile_path(current_user.profile), alert: " You alredy have a profile"
   else    
    @profile = current_user.build_profile
   end

  end
  
  def def create
    @profile = current_user.build_profile

    if @profile.save
      flash[:success] = "Profile successfully created"
      redirect_to @profile
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: " Profile updated"
    else
      render :edit
    end
  end

  private
  def set_profile
    @profile = current_user.build.profile(params[:id])
  end
  
  def profile_params
    params.require(:profile).permit(:bio)
  end
  
end