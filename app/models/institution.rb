class Institution < ActiveRecord::Base
  has_many :buildings, dependent: :destroy

  validates :name, :role_name, presence: true
end
