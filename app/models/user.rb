class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, presence: true,
         length: { in: 6..20 },
         allow_blank: true,
         format: { with: /(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])/ }

  validates :email, presence: true,
      uniqueness: true,
      format: { with: URI::MailTo::EMAIL_REGEXP }

  def running_session 
    WorkSession.where(id: Task.where(user_id: id)).where('end IS NULL').any?
  end
end
