class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :job
  has_many   :words
  has_many   :comments, dependent: :destroy
  has_one_attached :user_image

  def self.search(search)
    if search != ""
      User.where('nickname LIKE(?)', "%#{search}%")
    else
      User.all
    end
  end

  with_options presence: true do
    validates :nickname
    validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' }
    validates :name_kana, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カナ文字を使用してください' }
    validates :user_image
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は6文字以上かつ英数字をそれぞれ含めてください' }
  validates :job_id, numericality: { other_than: 1 }
end
