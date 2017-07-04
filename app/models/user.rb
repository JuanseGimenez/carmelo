class User < ApplicationRecord
  searchkick
  has_many :trips, dependent: :destroy
  has_many :active_relationships, class_name:   "Relationship",
  foreign_key:  "subscriber_id",
  dependent:    :destroy
  has_many :subscribing, through: :active_relationships, source: :trip
  has_many :posts, dependent: :destroy
  has_many :cars
  has_many :friendships
  has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"

  has_many :active_friends, -> { where(friendships: { confirmed: true}) }, through: :friendships, source: :friend
  has_many :received_friends, -> { where(friendships: { confirmed: true}) }, through: :received_friendships, source: :user
  has_many :pending_friends, -> { where(friendships: { confirmed: false}) }, through: :friendships, source: :friend
  has_many :requested_friendships, -> { where(friendships: { confirmed: false}) }, through: :received_friendships, source: :user

  #validations

  validates :name,          presence: true
  validates :location,            presence: true
  validates :gender,              presence: true
  validates :birthdate,           presence: true
  validates :phone_number,        presence: true


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :registerable, :rememberable, :trackable,
  :validatable, :omniauthable, :omniauth_providers => [:facebook]


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20] # Devise requires this
      user.facebook_image_url = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.name = data["name"]
        user.uid = session["devise.facebook_data"]["uid"]
        user.facebook_image_url = session["devise.facebook_data"]["info"]["image"]
      end
    end
  end

  def subscribe(param)
    subscribing << param
  end

  def unsubscribe(param)
    subscribing.delete(param)
  end

  def subscribing?(param)
    subscribing.include?(param)
  end

  def friends
    active_friends | received_friends
  end

  def pending
    pending_friends | requested_friendships
  end
end