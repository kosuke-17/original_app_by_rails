class Job < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '小学生' },
    { id: 3, name: '中学生' },
    { id: 4, name: '高校生' },
    { id: 5, name: '専門・短期学生' },
    { id: 6, name: '大学生' },
    { id: 7, name: '社会人' },
    { id: 8, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :users
  end