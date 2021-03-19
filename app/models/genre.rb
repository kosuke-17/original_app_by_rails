class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'サッカー' },
    { id: 3, name: '野球' },
    { id: 4, name: 'バスケットボール' },
    { id: 5, name: 'バレーボール' },
    { id: 6, name: 'テニス' },
    { id: 7, name: '卓球' },
    { id: 8, name: 'バトミントン' },
    { id: 9, name: 'ゴルフ' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :words
  end