class User < ApplicationRecord
  extend Dragonfly::Model
  include Avatarable

  default_scope -> { where(deleted_at: nil) }

  has_many :addresses, -> { where(kind: [:billing, :shipping]) }, as: :addressable
  has_one :welcome_discount, class_name: 'Discounts::WelcomeDiscount', dependent: :nullify
  has_many :ratings, as: :rateable
  has_many :credit_cards, dependent: :nullify
  has_many :orders, dependent: :nullify

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable,
         :omniauthable, omniauth_providers: %i[facebook]

  def avatar_text
    email.chr.capitalize
  end

  def self.deleted
    unscoped.where.not(deleted_at: nil)
  end

  def after_confirmation
    create_welcome_discount
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.image = auth.info.image
      user.confirm
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def soft_delete
    update_attributes(deleted_at: Time.current)
  end

  def active_for_authentication?
    super && !deleted_at
  end

  def inactive_message
    !deleted_at ? super : :deleted_account
  end
end
