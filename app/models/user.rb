class User < ApplicationRecord
  devise :database_authenticatable,
         :trackable,
         :rememberable,
         :omniauthable,
         omniauth_providers: [:github]

  def self.from_omniauth(access_token)
    info = access_token.info
    user = User.where(email: info.email).first
    user ||= User.create(
      email: info.email,
      password: Devise.friendly_token[0, 20]
    )
    user.username = info.nickname
    user.name = info.name
    user.image_remote_url = info.image
    user.save if user.changed?
    user
  end
end
