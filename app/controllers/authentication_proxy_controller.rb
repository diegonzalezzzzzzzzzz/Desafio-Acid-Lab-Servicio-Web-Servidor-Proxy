class AuthenticationProxyController < ApplicationController

  protect_from_forgery with: :null_session

  def login_is_valid?

      data_json = request.raw_post
      data_json_parse = JSON.parse(data_json)

        ap "Proxy evaluating email:" 
        ap params[:email]

        email = params[:email]
        image = data_json_parse["image"]

        if AuthenticationProxyController.searh_user(email,image)
          ap "Proxy evaluation result: Successful Verification:" 
          subject = "New User Verification Attempt: Successful"
          message_content = { "message"=>"OK", "status"=>200 }
          AuthenticationProxyController.send_mail(email,subject,message_content)
        else
          ap "Proxy evaluation result: Proxy Failed Verification:"
          subject = "New User Verification Attempt: Failed"
          message_content = { "message"=>"No Autorizado", "status"=>401 }
          AuthenticationProxyController.send_mail(email,subject,message_content)
        end

        render json: message_content

  end


  def self.searh_user(email,image)

    flag_exist_user = false

    if User.where(email: email, image: image).first 
      flag_exist_user = true
    else
      flag_exist_user = false
    end

    return flag_exist_user

  end

  def self.send_mail(email,subject,message_content)

    UserMailer.welcome_email(email, subject, message_content).deliver_now!

  end


end
