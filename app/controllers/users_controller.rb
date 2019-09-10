class UsersController < ApplicationController

    # before_action :authorize

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        # byebug
        if @user.valid?
            @user.save
            redirect_to @user
        else
            flash[:messages] = @user.errors.full_messages
            redirect_to new_user_path
        end  
    end

    def show
        @user = User.find(params[:id])
    end



    def edit
        @user = User.find(params[:id])
    end



    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            flash[:messages] = @user.errors.full_messages
            redirect_to edit_user_path
        end
    end



    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to new_user_path
    end

    #---------------------

    def follow_player
        Follow.create(player_id: params[:player_id], user_id: current_user.id)
        redirect_to user_path(current_user.id)
    end

    def unfollow_player
        player_to_unfollow = Follow.find_by(player_id: params[:player_id])
        player_to_unfollow.delete
        redirect_to user_path(current_user.id)
    end

    #---------------------
    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end