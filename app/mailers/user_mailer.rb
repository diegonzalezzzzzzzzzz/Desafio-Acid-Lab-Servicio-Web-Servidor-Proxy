class UserMailer < ApplicationMailer

    def welcome_email(email,subject,message_content)
      @message_content = message_content

        mail(from: "kenderson04@gmail.com", 
             to: email, subject: subject)
    end

end
