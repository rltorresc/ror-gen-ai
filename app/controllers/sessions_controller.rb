class SessionsController < ApplicationController
    def new; end

    def create
        if user = User.authenticate_by(email: params[:email], password: params[:password])
            login user
            redirect_to root_path, notice: "You have successfully logged in!"
        else
            flash.now.alert = "Invalid email or password"
            render :new, status: :unauthorized
        end
    end

    def destroy
        logout
        redirect_to root_path, notice: "You have successfully logged out!"
    end
end