class User < ActiveRecord::Base
  validates :username, :session_token, :password_digest, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 8, allow_nil: true }

  has_many :goals

  has_many :authored_comments,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Comment

  has_many :comments,
    as: :commentable

  has_many :cheers,
    primary_key: :id,
    foreign_key: :cheerer_id,
    class_name: :Cheer

  attr_reader :password

  after_initialize :ensure_session_token

  def password=(password)
    #code
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    pw_dig = BCrypt::Password.new(self.password_digest)
    pw_dig.is_password?(password)
  end

  def reset_session_token
    self.session_token = self.class.generate_session_token
    self.save
    self.session_token
  end

  def self.generate_session_token
    SecureRandom.urlsafe_base64(32)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user
    user.is_password?(password) ? user : nil
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end


end
