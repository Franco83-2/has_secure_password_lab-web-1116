class User < ActiveRecord::Base
  validates :password, :confirmation => true


  def authenticate(pass)
    pass == self.password ? self : false
  end
end
