class UserMailer < ApplicationMailer
    def new_user(user)
        @user = user

        attachments.inline["Pastas.jpg"] = File.read("#{Rails.root}/public/images/Pastas.jpg")

        mail(to:user.email, subject:"¡Nuevo usuario creado!")
    end
end
