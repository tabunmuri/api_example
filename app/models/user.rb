class User < ActiveRecord::Base
  validates :password,
            presence: true,
            length: { minimum: 8 }

  # メールアドレスフォーマットの検証（完璧な正規表現ではない）
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            format: { with: VALID_EMAIL_REGEX }

  validates :name,
            presence: true,
            length: { maximum: 120 }
end
