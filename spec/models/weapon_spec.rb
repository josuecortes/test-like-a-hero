require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it "is invalid if the level is less than 1" do
    weapon = build(:weapon, level: 0)
    expect(weapon).to_not be_valid
  end

  it "returns the current power" do
    level = FFaker::Random.rand(1..99)
    weapon = create(:weapon, level: level)
    expect(weapon.current_power).to eq("#{weapon.power_base + ((level-1) * weapon.power_step)}")
  end

  it "returns the name and level of weapon" do
    weapon = create(:weapon)
    expect(weapon.title).to eq("#{weapon.name} ##{weapon.level}")
  end

end
