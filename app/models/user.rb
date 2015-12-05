class User < ActiveRecord::Base

  validates_presence_of :first_name, :last_name, :email, :password

  validates_uniqueness_of :email

  has_secure_password

  def self.authenticate(email, password)
    # @user = User.find_by_email(email)
    # if @user == nil
    #   return false
    # elsif @user.password == password
    #   return true
    #   # email and password MATCH
    # else
    #   return false
    #   # email matches, password DOES NOT
    # end
    @user = User.find_by_email(email)

    if !@user.nil?
      if @user.authenticate(password)
        return @user
      end
    end

    return nil
  end

end
