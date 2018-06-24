class AccountsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(resource_params).save
        redirect_to new_account_path
    end

    private

    def resource_params
        params.require(:user).permit(:name, :email, :password)
    end
    
end