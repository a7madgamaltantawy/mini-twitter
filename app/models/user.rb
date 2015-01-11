class User < ActiveRecord::Base

has_many:posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body


has_many :relationships, :foreign_key =>'follower_id', :dependent => :destroy

has_many :followeds, :through => :relationships

has_many :reverse_relationships, :class_name =>Relationship ,:foreign_key =>'followed_id', :dependent => :destroy
has_many :followers, :through=> :reverse_relationships





def follow!(other_user)
  relationships.create!(followed_id: other_user.id)
end












def unfollow!(other_user)
  relationships.find_by_followed_id(other_user.id).destroy
end



def following?(other_user)
  relationships.find_by_followed_id(other_user.id)
end
end
