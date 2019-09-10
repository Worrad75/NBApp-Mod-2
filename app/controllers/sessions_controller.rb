class SessionsController < ApplicationController

    def new
        # byebug
    end

    def create
        # byebug
        user = User.find_by(username: params[:username])
        # byebug
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user.id)
        else
            flash.now[:messages] = ["Invalid password"]
            render :new
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to new_session_path
    end

end

