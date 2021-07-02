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
    password: "Quang@An16091998",
    status: "active"
  )
end

@i = 1
User.where.not(id: User.first.id).each do |user|
  user.create_company(
    name: Faker::Company.name,
    address: [Faker::Address.street_address, Faker::Address.city].join(" , "),
    founded: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
    website: "example.com",
    description: "Test",
    user_id: user.id,
    avatar: File.open(File.join(Rails.root, "images/hiring_img#{@i}.png"))
  )
  @i += 1
end

Company.where.not(id: Company.first.id).each do |company|
  Job.create!(
    title: Faker::Job.title,
    describe: "<h2>JOB DESCRIPTION</h2>\r\n\r\n<p>Google is and always will be an engineering company. We hire people with a broad set of ical skills who are ready to tackle some of technology&#39;s greatest challenges and make an impact on millions, if not billions, of users. At Google, engineers not only revolutionize search, they routinely work on massive scalability and storage solutions, large-scale applications and rely new platforms for developers around the world. From AdWords to Chrome, Android to Ye, Social to Local, Google engineers are changing the world.</p>\r\n\r\n<ul>\r\n	<li><a href=\"#\">www.example.com</a></li>\r\n	<li><a href=\"#\">Download Info</a></li>\r\n</ul>\r\n\r\n<h2>RESPONSIBILITIES</h2>\r\n\r\n<p>Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur aliquet quam id dui posuere blandit.</p>\r\n\r\n<ul>\r\n	<li>Build next-generation web applications with a focus on the client side.</li>\r\n	<li>Redesign UI&#39;s, implement new UI&#39;s, and pick up Java as necessary.</li>\r\n	<li>Explore and design dynamic and compelling consumer experiences.</li>\r\n	<li>Design and build scalable framework for web applications.</li>\r\n</ul>\r\n\r\n<h2>MINIMUM QUALIFICATIONS</h2>\r\n\r\n<ul>\r\n	<li>BA/BS degree in a technical field or equivalent practical experience.</li>\r\n	<li>2 years of relevant work experience in software development.</li>\r\n	<li>Programming experience in C, C++ or Java.</li>\r\n	<li>Experience with AJAX, HTML and CSS.</li>\r\n</ul>\r\n\r\n<h2>HOW TO APPLY</h2>\r\n\r\n<p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Curabitur aliquet quam id dui posuere blandit. Curabitur aliquet quam id dui posuere blandit. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus.</p>\r\n",
    salary: 1000,
    company_id: company.id,
    experience: 3,
    job_type: :full_time,
    end_at: Date.current + 7.days,
    address: [Faker::Address.street_address, Faker::Address.city].join(" , "),
    location_ids: ["1", "2"],
  )
end