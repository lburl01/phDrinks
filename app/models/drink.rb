class Drink < ApplicationRecord
  validates :name, presence: true

  has_many :mixed_drinks
  has_many :games
  has_many :ingredients, through: :mixed_drinks

  def self.get_random_drinks
    random_drinks = Drink.limit(5).order("RANDOM()")
  end

end
