class User < ActiveRecord::Base

  has_many :questions
  has_many :answers
  has_many :comments

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true

def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, password)
    user_to_authenticate = User.find_by(email: email)
    if user_to_authenticate
      return user_to_authenticate if user_to_authenticate.password == password
    end
    nil
  end
end
