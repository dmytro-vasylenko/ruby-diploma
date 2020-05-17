class Institution < ApplicationRecord
  has_many :visitor
  has_one :admin
end
