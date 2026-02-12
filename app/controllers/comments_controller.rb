class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_comment, only: [:show, :destroy]


  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to @post, notice: "Comment was successfully created."
    else
      redirect_to @post, notice: "Failed to create comment."
    end
  end

  def show 
   
  end

  def destroy
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      redirect_to @post, notice: "Comment was successfully deleted."
  end

  private
   def set_post
     @post = Post.find(params[:post_id])
   end
   
   def set_comment 
     @comment = @post.comments.find(params[:id])
   end

   def comment_params
      params.require(:comment).permit(:body)
   end



end