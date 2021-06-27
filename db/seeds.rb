locals = ["Hà Nội", "Đà Nẵng", "Tp.Hồ Chí Minh"]

locals.each do |local|
  Location.create name: local
end

skills = ["Html", "Css", "JavaScript", "Ruby", "Java", "C", "C++", "Python"]

skills.each do |skill|
  Skill.create name: skill
end


20.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    role: "recruiter",
    birthday: Faker::Date.between(from: '2014-09-23', to: '2021-09-25'),
    password: "123456"
  )
end

User.where.not(id: User.first.id).each do |user|
  Company.create(
    name: Faker::Company.name,
    address: [Faker::Address.street_address, Faker::Address.city].join(" , "),
    founded: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
    website: "example.com",
    description: "Test",
    user_id: user.id
  )
end

Company.where.not(id: Company.first.id).each do |company|
  Job.create!(
    title: Faker::Job.title,
    describe: "test",
    salary: 1000,
    company_id: company.id,
    experience: 3,
    job_type: :full_time,
    end_at: Date.current + 3.days,
    address: [Faker::Address.street_address, Faker::Address.city].join(" , "),
    location_ids: ["1", "2"]
  )
end