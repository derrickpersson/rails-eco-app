class User < ActiveRecord::Base
    has_secure_password
    validates :email, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 7 }

    def self.authenticate_with_credentials(email, password)
        emailCleaned = email.strip.downcase
        @user = User.find_by_email(emailCleaned)
        if @user.authenticate(password)
          @user
        else
          nil
        end
      end
end
