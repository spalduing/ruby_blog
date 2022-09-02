# frozen_string_literal: true

class User < ApplicationRecord
  has_many :articles, dependent: :destroy

  has_many :received_follows, foreign_key: :followed, class_name: 'Follow'
  has_many :followers, through: :received_follows, source: :follower

  has_many :given_follows, foreign_key: :follower, class_name: 'Follow'
  has_many :followings, through: :given_follows, source: :followed

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
