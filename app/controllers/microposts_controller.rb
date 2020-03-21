class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:show, :new, :create, :destroy]
  
  def show
  end
  
  def new
  end
  
  def create
  end
  
  def destroy
  end
end
