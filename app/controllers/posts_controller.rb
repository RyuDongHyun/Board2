class PostsController < ApplicationController
  def index
    unless session[:current_user_id]
      redirect_to '/user/login'
    end
    @posts=Post.all
    @users=User.all
  end

  def new
  end
  
  def register
    user=User.find(session[:current_user_id])
    Post.create(
      title: params[:title],
      content: params[:content],
      img_url: params[:img_url],
      tag: params[:tag],
      name: user.name
      )
      redirect_to '/posts/index'
  end

  def show
    @post=Post.find(params[:id])
    @user=User.find(session[:current_user_id])
    
  end
  
  def delete
    post=Post.find(params[:id])
    post.destroy
    
    redirect_to '/posts/index'
  end
  
  def edit
    @post=Post.find(params[:id])
  end
  
  def update
    post=Post.find(params[:id])
    post.update(
      title: params[:title],
      content: params[:content],
      img_url: params[:img_url],
      tag: params[:tag]
      )
    redirect_to '/posts/index'
  end
end
