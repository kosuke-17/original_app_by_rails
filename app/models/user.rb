class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :job
  has_many   :words
  has_many   :comments
  has_one_attached :user_image

  def self.search(search)
    if search != ""
      User.where('name LIKE(?)', "%#{search}%")
    else
      User.all
    end
  end
  
  validates :nickname, presence: true
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' }
  validates :name_kana, presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カナ文字を使用してください' }
  validates :job_id, numericality: { other_than: 1 }
end
