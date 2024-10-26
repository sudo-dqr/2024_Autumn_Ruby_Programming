class CommentsController < ApplicationController
  before_action :set_blog
  before_action :set_comment, only: %i[show edit update destroy]

  def index
    @comments = @blog.comments
  end

  def show
  end

  def new
    @comment = @blog.comments.build
  end

  def edit
  end

  def create
    @comment = @blog.comments.build(comment_params)

    if @comment.save
      redirect_to [@blog, @comment], notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to [@blog, @comment], notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to blog_comments_url(@blog), notice: 'Comment was successfully destroyed.'
  end

  private

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

  def set_comment
    @comment = @blog.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end