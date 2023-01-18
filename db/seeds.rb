# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# seedファイルは一度実行するとDBの中に作成されるので、再度rails db:seedをする際は、記載した内容は削除するかコメントアウトすること
# Admin.create!(
#   email: 'test-admin@test.com',
#   password: 'test-admin')

# Genre.create!(
#   [
#     {name: 'ケーキ'},
#     {name: 'プリン'},
#     {name: '焼き菓子'},
#     {name: 'キャンディ'}
#   ]
#   )

#   Customer.create!(
#     last_name: '福田',
#     first_name: '泰史',
#     last_name_kana: 'フクダ',
#     first_name_kana: 'ヒロフミ',
#     telephone_number: '000-1111-2222',
#     email: 'hirofumi_f@example.com',
#     password: '19930513',
#     postal_code: '000-1111',
#     address: '東京都葵市1−16−16 パークハイツ家康123',
#     is_deleted: 'FALSE'
#     )