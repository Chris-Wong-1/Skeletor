class User < ActiveRecord::Base
  include BCrypt

  validates_presence_of :username, :email, :password_hash
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate?(password)
    self.password == password
  end

end
