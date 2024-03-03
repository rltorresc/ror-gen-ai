class PasswordChangesController < ApplicationController
    before_action :authenticate_user!

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        if current_user.update(password_params)
            redirect_to root_path, notice: "Password successfully updated!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation, :password_challenge).with_defaults(password_challenge: '')
    end
end