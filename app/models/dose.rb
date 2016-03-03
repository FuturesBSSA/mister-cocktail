class Dose < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :ingriedent
  validates  :description, :cocktail_id, :ingriedent_id, presence: true
  validates  :ingriedent_id, uniqueness: { scope: :cocktail_id }
end
