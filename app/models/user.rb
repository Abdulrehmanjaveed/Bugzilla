class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bugs
  has_many :project_users
  has_many :projects, through: :project_users

  def manager?
    user_type == 'manager'
  end

  def developer?
    user_type == 'developer'
  end

  def qa?
    user_type == 'qa'
  end
end
