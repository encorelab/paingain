# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


site = Comfy::Cms::Site.find_by(label: 'PainGain')
if site.nil?
  site = Comfy::Cms::Site.create!(
    label: 'PainGain',
    identifier: 'paingain',
    hostname: 'localhost',
    path: '/',
    locale: 'en',
    is_mirrored: false
    )
end



group = Group.find_by(name: 'Encore Lab')
if group.nil?
  group = Group.create!(
    name: 'Encore Lab'
  )
end

['miketissenbaum@gmail.com','thom.berry@gmail.com'].each do |email|
  if User.find_by(email: email).nil?
    User.create!(
        email: email,
        role: 'admin',
        first_name: 'default',
        last_name: 'default',
        group: group,
        password: 'password',
        password_confirmation: 'password'
      )
  end
end


