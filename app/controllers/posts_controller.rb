class PostsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end


class PostsController < ApplicationController

  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find params[:id]
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to :action => 'show', :id => @post.id
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @post = Post.find params[:id]
    @post.destroy
  end
  
  def edit
    @post = Post.find params[:id]
  end
  
  def update
    @post = Post.find( params[:id])
    if @post.update_attributes(post_params)
      redirect_to :action => 'show', :id => @post.id
    end
  end

  private

def post_params
  if params[:post]
    params.require(:post).permit(:title, :description)
  end
end

end