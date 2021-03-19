class Word < ApplicationRecord
  belongs_to :user
  #has_one_attached :image
  #has_many :comments

  with_options presence: true do
    validates :name,  presence: true
    validates :note,  presence: true
    #validates :image
  end

  validates :genre, numericality: { other_than: 1 }
end
