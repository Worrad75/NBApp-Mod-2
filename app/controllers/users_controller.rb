class UsersController < ApplicationController

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
        # redirect_to new_session_path
    end

    #---------------------

    def follow_player(player_id, favorite = false)
        Follow.create(player_id, self.id, favorite)
    end

    #---------------------
    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end