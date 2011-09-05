class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def show    
    begin
      @user = User.find(params[:id])
    rescue Exception => e
      return redirect_to current_user
    end
    
    unless @user == current_user
      return redirect_to current_user
    end
    
    @habrausers = @user.habrausers
  end

end
