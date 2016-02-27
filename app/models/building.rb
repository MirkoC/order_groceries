class Building < ActiveRecord::Base
  belongs_to :institution
  has_many :orders, dependent: :destroy
end
