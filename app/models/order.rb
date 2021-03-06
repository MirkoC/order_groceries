class Order < ActiveRecord::Base
  belongs_to :building
  belongs_to :created_by, class_name: 'User'
  belongs_to :updated_by, class_name: 'User'

  validates :building, :created_by, :updated_by, presence: true
end
