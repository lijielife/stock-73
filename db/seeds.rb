# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Manufacturer.create(:manufacturer_name => 'P&G')
Manufacturer.create(:manufacturer_name => 'ロート製薬')
Manufacturer.create(:manufacturer_name => '花王')
Manufacturer.create(:manufacturer_name => 'ライオン')
Manufacturer.create(:manufacturer_name => 'Schick')
Manufacturer.create(:manufacturer_name => 'クラシエ')
Manufacturer.create(:manufacturer_name => '資生堂')

