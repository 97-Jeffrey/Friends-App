class Friend < ApplicationRecord
  validates :first_name, presence:true
  belongs_to :user

end
