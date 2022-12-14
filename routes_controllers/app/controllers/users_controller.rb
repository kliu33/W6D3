class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(user_params[:id])
        @user.destroy
        # redirect_to user_url(@user)
    end


    private
    def user_params
        params.require(:user).permit(:id, :name, :email)
    end

end
