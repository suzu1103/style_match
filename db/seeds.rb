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
  { name: '明るいブラウン'},
  { name: 'ソフトな黒'},
  { name: 'ダークブラウン'},
  { name: '真っ黒'},
  
  # 肌の色
  { name: 'ピンク寄り'},
  { name: 'オークル系'},
  
  # 唇の色
  { name: 'サーモンピンク系'},
  { name: '青み寄りのピンク'},
  { name: 'オレンジ系'},
  { name: 'ローズ'},

  # 服の色
  { name: 'パステルカラー'},
  { name: 'ダークトーン'},
  
  # アクセサリーの色
  { name: 'ゴールド'},
  { name: 'シルバー'},

  # 体の重心
  { name: '上半身'},
  { name: '下半身'},
  { name: 'どちらでもない'},
  
  # 首〜肩
  { name: '鎖骨は目立たず、首は短め'},
  { name: '鎖骨はやや目立ち、首は細長い'},
  { name: '鎖骨は目立ち、肩幅は広め'},

  # 手
  { name: '小さめで、厚みがあり、手首の断面は丸に近い'},
  { name: '普通サイズで、薄めで、手首の断面は楕円形に近い'},
  { name: '大きめで、骨や筋が目立ち、手首の断面は長方形に近い'},
  
  # ウエストの位置
  { name: '高い'},
  { name: '低い'},
  { name: '中間'},

  # 脚
  { name: '太ももは太く、膝下は細い'},
  { name: '太ももは細く、膝下に肉が付きやすい'},
  { name: '骨や筋が目立ち、膝が目立つ'},
  
  # 肌の感触
  { name: '弾力がある'},
  { name: 'やわらかい'},
  { name: 'マット'},
  
])