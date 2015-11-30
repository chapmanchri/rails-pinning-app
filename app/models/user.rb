class User < ActiveRecord::Base

  def self.authenticate(email, password)

    puts email * 100
    @user = User.find_by_email(email)
    if @user == nil
      return false
      # email DOES NOT match
    elsif @user.password == password
      return true
      # email and password MATCH
    else
      return false
      # email matches, password DOES NOT
    end


  end

end
