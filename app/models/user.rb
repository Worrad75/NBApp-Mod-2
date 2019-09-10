# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#

class User < ApplicationRecord
    has_secure_password
    has_many :follows
    has_many :players, through: :follows
    has_many :teams, through: :players
    validates :password, length: { minimum: 6 }
    validates :username, uniqueness: true
end
