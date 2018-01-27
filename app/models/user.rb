class User < ApplicationRecord
  validates_presence_of(:name, :mail, :gender, :age)
end
