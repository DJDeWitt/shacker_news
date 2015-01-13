class User < ActiveRecord::Base

  #associations
  has_many :posts, foreign_key: "author_id"
  has_many :comments, foreign_key: "author_id"
  has_secure_password

  #validations


  #methods
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

end
