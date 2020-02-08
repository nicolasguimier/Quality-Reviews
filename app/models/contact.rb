class Contact #< ActiveRecord::Base
  include ActiveModel::Model
  attr_accessor :name, :email, :phone, :message
  validates :email, presence: true, format: {
    with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
    message: "must be a valid email address"
  }
  validates :name, :phone, :message, presence: true
end
