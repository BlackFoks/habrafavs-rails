Factory.define :user do |f|
  f.sequence(:name) { |n| "username#{n}" }
  f.sequence(:email) { |n| "mail#{n}@gmail.com" }
  f.password 'password123'
  f.password_confirmation { |u| u.password }
  f.remember_me false
end

Factory.define :habrauser, :aliases => [:author] do |f|
  f.user
  f.sequence(:name) { |n| "HabraUser#{n}" }
  f.slug { |u| u.name_to_slug }
end

Factory.define :blog do |f|
  f.sequence(:slug) { |n| "blog#{n}_slug" }
  f.sequence(:name) { |n| "Habrablog ##{n}" }
end

Factory.define :post do |f|
  f.blog
  f.title "Habrapost Title"
  f.content "Habrapost preview <habracut /> Habrapost full content"
  f.published_at { 7.hours.ago }
  f.author
end
