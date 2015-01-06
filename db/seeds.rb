# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Topic.destroy_all

50.times do
  t = Topic.create(name: '臭臭狗', info: Faker::Lorem.paragraph)
  3.times do
    e = Example.create(sentence: Faker::Lorem.sentence)
    e.hanyu.meaning = Faker::Lorem::word
    e.save
    t.examples << e
    t.save
  end
end

p "topic: #{Topic.count}"