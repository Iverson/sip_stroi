# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Project.create([
# 	{name: 'Ньютек', area: 55, description: 'Данная комплектация составлена нашим заводом, для наших дилеров и профессиональных строителей'},
# 	{name: 'Скандинавия', area: 69, description: 'Крыльцо и террасы обсуждаются и рассчитываются отдельно по согласованию с заказчиком'}
# 	])

if ProjectInstanceType.all.empty?
	ProjectInstanceType.create([
		{name: 'Панели'},
		{name: 'Домокомплект'},
		{name: 'Со сборкой и фундаментом'},
		{name: 'Под чистовую внутреннюю отделку'}
		])
end
