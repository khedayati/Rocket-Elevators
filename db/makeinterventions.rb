puts "Making Leads"
require "json"
require "faker"
$j = 0
lead_progressbar = ProgressBar.create(:total => $num)
while $i < $num do
  if $i == 146
    Faker::UniqueGenerator.clear  
  end

  @interventions = Intervention.create!(
    author = Faker::Name.unique.name
    customerId = Faker::App.name
    buildingId = Faker::Number.unique.between(from: 1, to: 300)
    batteryId = Faker::Number.unique.between(from: 1, to: 300)
    columnId = Faker::Number.unique.between(from: 1, to: 300)
    elevatorId = Faker::Number.unique.between(from: 1, to: 300)
    employeeId = Faker::Number.unique.between(from: 1, to: 300)
    start_date = Faker::Date.between(from: 730.days.ago, to: Date.today)
    end_date = Faker::Date.between(from: 730.days.ago, to: Date.today)
    result = Faker::Lorem.sentence(word_count: 1)
    report = Faker::Lorem.unique.sentence
  }

end
