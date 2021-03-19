class Word < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :genre
  belongs_to       :user
  has_one_attached :image
  has_many         :comments, dependent: :destroy

  with_options presence: true do
    validates :name,  presence: true
    validates :note,  presence: true
    validates :image
  end

  validates :genre_id, numericality: { other_than: 1 }
end
