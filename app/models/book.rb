class Book < ApplicationRecord
  belongs_to :user
  
  validates :title, presene:ture
  validates :body, presene:ture, length: {maximum: 200}
end
