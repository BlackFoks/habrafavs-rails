Factory.define :user do |f|
  f.sequence(:name) { |n| "username#{n}" }
  f.sequence(:email) { |n| "mail#{n}@gmail.com" }
  f.password 'password123'
  f.password_confirmation { |u| u.password }
  f.remember_me false
end

Factory.define :habrauser do |f|
  f.user
  f.sequence(:name) { |n| "HabraUser#{n}" }
  f.slug { |u| u.name_to_slug }
end