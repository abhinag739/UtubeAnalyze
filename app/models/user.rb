class User < ActiveRecord::Base
  class << self
    def from_omniauth(auth)
      user = User.find_or_initialize_by(uid: auth['uid'])
      user.name = auth  ['info']['name']
      user.save!
      user
    end
  end
end