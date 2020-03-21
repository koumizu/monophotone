class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:show, :new, :create, :destroy, :likes]
  before_action :correct_user,   only: :destroy
  
  def show
    @micropost = Micropost.find(params[:id])
    @comment = Comment.new 
    @comments = @micropost.comments.all
  end
  
  def new
    @micropost = Micropost.new
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to current_user
    else
      @feed_items = []
      render "new"
    end
  end
  
  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end
  
  def likes 
    @title = "いいねしたユーザー"
    @micropost = Micropost.find(params[:id])
    @users = @micropost.like_users.paginate(page: params[:page]).search(params[:search])
    render 'show_likes'
  end
  
  private
  
  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
  
end
