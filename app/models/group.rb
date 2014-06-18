class Group < ActiveRecord::Base
  has_many :users

  validates_uniqueness_of :name
  validates_presence_of :name
  validates :name, length: { in: 4..20 }

end
