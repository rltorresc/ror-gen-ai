class PasswordResetsController < ApplicationController
    def new; end

    def create
        if (user = User.find_by(email: params[:email]))
            PasswordMailer.with(user: user, token: user.generate_token_for(:password_reset)).password_reset_request.deliver_later

            redirect_to root_path, notice: "Password reset instructions have been sent to your email."
        end
    end

    def edit
        @user = User.find_by_token_for(:password_reset, params[:token])
        redirect_to new_password_reset_path, alert: "Invalid token." unless @user
    end

    def update
        @user = User.find_by_token_for(:password_reset, params[:token])
        if @user.update(password_params)
            redirect_to root_path, notice: "Password has been reset."
        else
            render :edit
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end

end