class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'トップス' },
    { id: 3, name: 'スカート' },
    { id: 4, name: 'パンツ' },
    { id: 5, name: 'ワンピース' },
    { id: 6, name: 'ドレス' },
    { id: 7, name: 'ジャケット' },
    { id: 8, name: 'アウター' },
    { id: 9, name: 'ルームウェア' },
    { id: 10, name: '靴下' },
    { id: 11, name: 'シューズ' },
    { id: 12, name: 'ファッション雑貨' },
    { id: 13, name: 'アクセサリー' },
    { id: 14, name: '水着' },
    { id: 15, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :notes
end
