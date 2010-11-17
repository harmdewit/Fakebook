class UsersController < ApplicationController 
  before_filter :authenticate_user!
   
  def index
    @users = User.all
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @users }
    end
  end
  
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @user }
    end
  end
end
