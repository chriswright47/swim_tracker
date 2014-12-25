class User < ActiveRecord::Base
  class AuthenticationError < StandardError; end

  # attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  attr_accessor :password

  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :if => Proc.new { |u| u.password.present? }
  validates_uniqueness_of :email, :if => Proc.new { |u| u.email.present? }

  class << self
    def authenticate(email, password)
      user = find_by_email(email) || raise(AuthenticationError, 'Email not found.')
      if user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        raise(AuthenticationError, 'Password was incorrect.')
      end
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def full_name
    format('%{first} %{last}', :first => first_name, :last => last_name).strip
  end
end