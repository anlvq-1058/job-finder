locals = ["Hà Nội", "Đà Nẵng", "Tp.Hồ Chí Minh"]

locals.each do |local|
  Location.create name: local
end

skills = ["Html", "Css", "JavaScript", "Ruby", "Java", "C", "C++", "Python"]

skills.each do |skill|
  Skill.create name: skill
end
