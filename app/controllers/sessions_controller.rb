class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find(username: params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user.id)
        else
            render :new
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to new_session_path
    end

end