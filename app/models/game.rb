class Game < ApplicationRecord
  validates :session, :user_id, :drink_id, presence: true

  belongs_to :user
  belongs_to :drink

  def self.generate_session(user)
    session_max = Game.where(user_id: user.id).maximum(:session)
    if session_max.nil?
      @session = 1
    else
      @session = session_max += 1
    end
    return @session
  end
end
