class ForumsController < ApplicationController

    def index
        @forums = Forum.all
    end

    def new
        @forum = Forum.new
        @players = Player.all
    end

    def create
        @forum = Forum.new(forum_params)
        @forum[:author_id] = current_user.id
        if @forum.valid?
            @forum.save
            redirect_to @forum
        else
            flash[:messages] = @forum.errors.full_messages
            redirect_to new_forum_path
        end
    end

    def show
        @forum = Forum.find(params[:id])
    end

    def edit 
        @forum = Forum.find(params[:id])  
    end

    def update
        @forum = Forum.find(params[:id])

        if @forum.update(forum_params)
            redirect_to @forum
        else
            flash[:messages] = @forum.errors.full_messages
            redirect_to edit_forum_path
        end
    end

    def destroy

    end

    private

    def forum_params
        params.require(:forum).permit(:title, :description, :player_id)
    end


end