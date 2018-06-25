class SessionsController < ApplicationController

    #before_action :user_signed_in_check?
    
    def new
    end

    def create
        #render plain: params.inspect
        email = params[:email]
        password = params[:password]

        user = User.find_by(email: email)
        if user
            if user.authenticate(password)
                session[:user_id] = user.id
                redirect_to blogs_path, notice: "Kamu sudah login"
            else
                redirect_to new_session_path, notice: "Passoword salah"
            end
        else
            redirect_to new_session_path, notice: "Data tidak ditemukan"
        end

    end

    def destroy
        session[:user_id] = nil
        redirect_to new_session_path, notice: "Anda sudah logout" 
    end
    
end