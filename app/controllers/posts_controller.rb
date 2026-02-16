class PostsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  before_action :authorize_user, only: [ :edit, :update, :destroy ]
  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
     if @post.save
      format.html { redirect_to @post, notice: "Post was successfully created." }
      format.json { render :show, status: :created, location: @post }
      
     else
      format.html { render :new }
      format.json { render json: @post.errors, status: :unprocessable_entity }
     end
    end
  end

  def edit
  end
  def update
    if @post.update(post_params)
        redirect_to @post, notice: "Post was successfully updated."
    else
        render :edit
    end
  end


  def destroy
    @post.destroy
  
      redirect_to posts_path, notice: "Post was successfully deleted."

   
  end

  private

  def authorize_user
   unless @post.user == current_user # authorize user before edit or updat or destroy post
    redirect_to posts_path, alert: "NOT ALLOWED"
   end
  end 

  def set_post
    @post=Post.find(params[:id])
  end


  def post_params
    params.require(:post).permit(:title, :body,:image)
  end
end

