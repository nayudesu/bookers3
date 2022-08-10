class Book < ApplicationRecord
  belongs_to :user
  
  validates :title, presene: true
  validates :body, presene: true, length: {maximum: 200}
end
