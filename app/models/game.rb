class Game < ApplicationRecord
  validates :session, :user_id, :drink_id, presence: true

  belongs_to :user
  belongs_to :drink

end
