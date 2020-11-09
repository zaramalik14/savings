# == Schema Information
#
# Table name: targets
#
#  id         :integer          not null, primary key
#  category   :string
#  gift       :string
#  goal       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Target < ApplicationRecord
  validates(:category, { :presence => true})
  validates(:category, { :uniqueness => true})
  validates(:gift, { :presence => true})
  validates(:goal, { :presence => true})

end
