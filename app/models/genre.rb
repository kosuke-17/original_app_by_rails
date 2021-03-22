class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'キック' },
    { id: 3, name: 'ドリブル' },
    { id: 4, name: 'パス' },
    { id: 5, name: 'トラップ' },
    { id: 6, name: 'ヘディング' },
    { id: 7, name: 'フリーキック' },
    { id: 8, name: 'コーナーキック' },
    { id: 9, name: 'スローイン' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :words
  end