class User < ApplicationRecord
  has_secure_password
  has_many :tasks, through: :projects
  has_many :projects, dependent: :destroy
end
