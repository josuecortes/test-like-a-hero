require 'rails_helper'

RSpec.describe "Weapon", type: :request do
  describe "GET /weapons" do
    it "the weapons name is present" do
      weapons = create_list(:weapon, 3)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.name)
      end
    end

    it "the weapons current_power is present" do
      weapons = create_list(:weapon, 3)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.current_power)
      end
    end
    
    it "the weapons title is present" do
      weapons = create_list(:weapon, 3)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.title)
      end
    end

    it "the link to weapon is present" do
      weapons = create_list(:weapon, 3)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon_path(weapon))
      end
    end
  end

  describe "POST /weapon" do
    it "when it has valid parameters" do
      weapon_attributes = FactoryBot.attributes_for(:weapon)
      post weapons_path, params: { weapon: weapon_attributes }
      expect(Weapon.last).to have_attributes(weapon_attributes)
    end

    it "when it has no valid parameters" do
      expect {
        post weapons_path, params: { weapon: { name: '', description: '', power_base: '', power_step: '', level: '' }}
      }.to_not change(Weapon, :count)
    end
  end

  describe "DELETE /weapons" do
    it "when delete weapon passign id" do
      weapon = create(:weapon)
      delete weapon_path(weapon.id)
      expect(Weapon.all).to_not include(weapon) 
    end
  end  

  describe "GET /weapon" do
    it "the weapon attributes is present" do 
      weapon = create(:weapon)
      get weapon_path(weapon.id)
      expect(response.body).to include(
                                        weapon.name, 
                                        weapon.description, 
                                        "#{weapon.level}", 
                                        weapon.current_power, 
                                        "#{weapon.power_step}",
                                        "#{weapon.power_base}",
                                        "#{weapon.title}"
                                      ) 
    end

    
  end  
end
