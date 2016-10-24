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

  def self.get_leaders
    @games = Game.all

    @all_users = []
    @users = @games.each do |game|
      @all_users << game.user_id
    end

    @each_user = @all_users.uniq

    @leaders_scores = {}
    @each_user.each do |user|
      total_score = Game.where(user_id: user).sum(:correct?)
      @leaders_scores[user] = total_score
    end

    return @leaders_scores.sort_by{ |user, total| total }.reverse

  end
end
