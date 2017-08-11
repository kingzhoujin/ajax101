class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  has_many :likes, :dependent => :destroy
  has_many :liked_posts, :through => :likes, :source => :post
  
  def display_name
    # # 取 email 的前半来显示，如果你也可以另开一个字段是nickname让用户可以编辑自己编辑
    self.email.split("@").first
  end
end
