class Building < ActiveRecord::Base
  belongs_to :institution
  has_many :orders, dependent: :destroy

  validates :name, :role_name, :institution, presence: true
end
