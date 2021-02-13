class Friend < ApplicationRecord
  validates :first_name, presence:true
  # validates :last_name, presence:true,
  # validates :phone_number, presence:true, length:{ minimum: 3}

end
