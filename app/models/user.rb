class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :games

  # def self.has_games?
  #   binding.pry
  #   @user = User.find(current_user.id)
  #   @game = Game.find(user_id: @user)
  #   if @game.nil?
  #     return false
  #   else
  #     return true
  #   end
  # end
end
