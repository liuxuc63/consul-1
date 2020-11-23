class SDG::LocalTarget < ApplicationRecord
  delegate :goal, to: :target

  translates :title, touch: true
  translates :description, touch: true
  include Globalizable

  validates_translation :title, presence: true
  validates_translation :description, presence: true

  validates :code, presence: true, uniqueness: true
  validates :target, presence: true

  belongs_to :target
end
