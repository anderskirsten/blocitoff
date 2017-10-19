class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :items
         
  def avatar_url(size)
     gravatar_id = Digest::MD5::hexdigest(self.email).downcase
     "https://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
end
