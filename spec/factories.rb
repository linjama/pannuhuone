FactoryGirl.define do

  factory :reservoir do
    volume 2500
    mass 350
    after(:create) do |reservoir|
      reservoir.temperature_sensors << FactoryGirl.build(
        :temperature_sensor, reservoir: reservoir
      )
    end
  end
  
  factory :temperature_sensor do
    temperature 57
    reservoir :reservoir
  end
  
  
end