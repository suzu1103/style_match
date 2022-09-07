# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin1@test.com',
  password: 'admin01',
)

DiagnosisTag.create([
  # 髪色
  { name: '黒髪'},
  { name: '茶髪'},
  
  # 目の色
  { name: '明るい茶色'},
  { name: 'グレー寄りの黒'},
  { name: 'ダークブラウン'},
  { name: '黒'},
  
  # 肌の色
  { name: 'ピンク寄り'},
  { name: 'オークル系'},
  
  # 唇の色
  { name: 'ピンク'},
  { name: 'オレンジ'},
  { name: 'コーラルピンク'},
  { name: 'ローズ'},
  
  # 日焼け後
  { name: '黒くなる'},
  { name: '赤くなる'},

  # 服の色
  { name: '紺色'},
  { name: 'ベージュ'},
  
  # アクセサリーの色
  { name: 'ゴールド'},
  { name: 'シルバー'},
])