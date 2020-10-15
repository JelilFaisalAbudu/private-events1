FactoryBot.define do
  factory :event do
    title { 'Web development' }
    description { 'Programming with rails' }
    date { Date.new(2009, 1, 3) }
    creator { User.first }
  end
end
