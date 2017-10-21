class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  has_secure_password

  def nearby
    max_latitude = self.latitude + 0.0009
    max_longitude = self.longitude + 0.0009
    min_latitude = self.latitude - 0.0009
    min_longitude = self.longitude - 0.0009

    nearby_users = []
    User.all.each do |user|
      if user.longitude > min_longitude && user.longitude < max_longitude
        if user.latitude > min_latitude && user.latitude < max_latitude
          nearby_users << user unless user.id == self.id
        end
      end
    end
    nearby_users
  end

  def current_user

  end

  def find_all_users
    User.all
  end
end
