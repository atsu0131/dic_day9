class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new
    if blog.save
      redirect_to blogs_path
    else
      render :new
    end

  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update
      redirect_to blogs_path
    else
      render :edit
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

end
