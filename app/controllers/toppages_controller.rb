class ToppagesController < ApplicationController
  def home
    if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page]).search(params[:search])
    end
  end
  
  def new_guest
    user = User.find_or_create_by!(name: "guest", email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    log_in(user)
    redirect_to root_path
  end
end
