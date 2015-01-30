# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Topic.destroy_all

u = User.create(email: 'baojjeu@gmail.com',
             password: 'password',
             password_confirmation: 'password',
             admi: true)
u.build_profile(name: 'baojjeu')
u.profile.save

t = Topic.new(name: '虽然…但是…。',
                 info: 'In order to make conversation simplier, sometimes we use `虽然…但…` instead of `虽然…但是…`',
                 published_at: Time.zone.now)
t.build_hanyu
t.hanyu.meaning = 'Although..., ...'
t.save


e = Example.new
e.sentence = '`虽然` CoCo 看上去很凶狠，`但是`它不曾咬人。'
e.build_hanyu
e.hanyu.meaning = 'CoCo looks really fierce, but it never bites someone.'
e.topic = t
e.save
e.hanyu.update(pinyin: '`suī rán` CoCo kàn shang qu hěn xiōng hěn, `dàn shì` tā bù céng yǎo rén.')

e2 = Example.new
e2.sentence = '`虽然`现在是冬天，`但是`我超想吃冰淇淋！'
e2.build_hanyu
e2.hanyu.meaning = 'Although it is winter now, I extremely want to taste ice cream.'
e2.topic = t
e2.save
e2.hanyu.update(pinyin: '`suī rán` xiàn zài shì dōng tiān, `dàn shì` wǒ chāo xiǎng chī bīng qí lín!')

e3 = Example.new
e3.sentence = '`虽然`告白被拒绝了，`但`我不觉得后悔。'
e3.build_hanyu
e3.hanyu.meaning = 'Although I was turned down by my confession, I feel nothing regretful.'
e3.topic = t
e3.save
e3.hanyu.update(pinyin: '`suī rán` gào bái bèi jù jué le, `dàn` wǒ bù jué de hòu huǐ.')