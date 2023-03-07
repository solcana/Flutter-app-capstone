class UsersController < ApplicationController
    def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_registration_path, notice: "User deleted."
    end
end