class Game < ApplicationRecord
  validates :session, :user_id, :drink_id, presence: true

  belongs_to :user
  belongs_to :drink

  def self.all_games(user)
    # @games = Game.where(user_id: user.id)
  end

end
