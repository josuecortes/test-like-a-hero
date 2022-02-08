class Weapon < ApplicationRecord

  validates :level, numericality: { greater_than: 0 }

  def current_power
    "#{self.power_base + ((self.level-1) * self.power_step)}"
  end

  def title
    "#{self.name} ##{self.level}"
  end
end
