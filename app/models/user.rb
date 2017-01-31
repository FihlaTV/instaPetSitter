class User < ApplicationRecord
  has_many :sitters, through: :favorites
  has_many :photos
  has_many :pets
  has_many :sit_pets
  has_many :favorites
  has_many :ratings
  attachment :picture
  accepts_nested_attributes_for :pets

  def full_street_address
    [address, city, state, zip].join(", ")
  end

  # Factory method to create a user from some omniauth data
  # Omniauth will use this to build a *NEW* user for us
  def self.from_omniauth(authentication_data)
    user = User.where(provider: authentication_data['provider'],
                      uid: authentication_data['uid']).first_or_create

    Rails.logger.debug "The user is #{user.inspect}"

    user.name         = authentication_data.info.name
    user.nickname     = authentication_data.info.nickname
    user.access_token = authentication_data.info.access_token

    user.save!

    Rails.logger.debug "After saving, the user is #{user.inspect}"

    return user
  end
end
