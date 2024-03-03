class PasswordMailer < ApplicationMailer
    def password_reset_request
        mail to: params[:user], subject: "Password Reset Request"
    end
end
