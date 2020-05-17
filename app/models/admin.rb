class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :institution

  def self.authorize(email, password)
    admin = Admin.where(email: email).first

    if admin&.valid_password?(password)
      admin
    end
  end
end
