FactoryBot.define do
  factory :job do
    title { "MyString" }
    status { "MyString" }
    job_type { "MyString" }
    location { "MyString" }
    account { nil }
  end
end
