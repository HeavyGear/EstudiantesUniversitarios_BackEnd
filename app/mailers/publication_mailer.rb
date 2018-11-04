class PublicationMailer < ApplicationMailer

    def new_publication(publication)
        @publication = publication

        user = User.get_user(@publication.user_id)

        attachments.inline["Pastas.jpg"] = File.read("#{Rails.root}/public/images/Pastas.jpg")

        mail(to:user.email, subject:"¡Nueva publicación creada!")
    end
end
