class AdminUser < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  devise :database_authenticatable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  def name
    email
  end

end
