FactoryGirl.define do

  factory :reservoir do
    volume 2500
    mass 350
    name 'main_reservoir'
    after(:create) do |reservoir|
      1.upto(5) do |i|
        reservoir.temperature_sensors << FactoryGirl.build(
          :temperature_sensor, reservoir: reservoir, temperature: 60-2*i
        )
      end
    end
  end
  
  factory :temperature_sensor do
    temperature 57
    reservoir :reservoir
  end
  
  
end