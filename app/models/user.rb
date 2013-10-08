class User < ActiveRecord::Base
  
  
   def self.create_user!(userHash)
      @seshToke = SecureRandom.base64
      userHash[:session_token] = @seshToke
      @user = User.create!(userHash)

      @id = userHash[:user_id]
      return @user
   end
end
