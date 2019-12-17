class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles
  before_save {self.email = email.downcase}
  validates :username, presence:true, length:{minimum: 2, maximum:20}, uniqueness: {case_sensitive: false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true , length:{maximum:100}, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}

end
