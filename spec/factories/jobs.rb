FactoryBot.define do
  factory :job do
    title { "job01" }
    status { "Open" }
    job_type { "Full time" }
    location { "Tokyo" }
    association :account
  end
end
