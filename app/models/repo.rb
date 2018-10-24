class Repo < ApplicationRecord
  validates :name, presence:true
  validates :description, presence:true
  validates :language, presence:true
  validates :contributors, presence:true
end
