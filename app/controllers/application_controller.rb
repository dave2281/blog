class ApplicationController < ActionController::Base
  def auth 
    unless session[:veryfied]
      input_code = params[:auth_code].to_s 
      puts input_code
      secret = "74XV7JAEY2N23EG5WROYGKPBQW24MYZB"
      validator = ROTP::TOTP.new(secret)
      if validator.verify(input_code)
        session[:veryfied] = true
      else
        render plain: 'Not Authorized', code: 401
        puts '#ERORR !BAD!PASSWORD'
      end
    end
  end
end
