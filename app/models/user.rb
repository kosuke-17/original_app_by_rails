class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :job
  #has_many :words
  #has_many :comments
  
  
  validates :name, presence: true
  validates :name_kana, presence: true
  validates :password, format: { with: /[a-z\d]{6,}/i, message: '半角英数字混在で入力してください' }
  validates :job_id, numericality: { other_than: 1 }
end
