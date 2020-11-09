# == Schema Information
#
# Table name: savings
#
#  id          :integer          not null, primary key
#  amount      :integer
#  by_doing    :string
#  category    :string
#  day_created :datetime
#  instead_of  :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Saving < ApplicationRecord
  validates(:amount, {:presence => true,})
  validates(:by_doing, { :presence => true,})
  validates(:instead_of, { :presence => true,})
  validates(:category, { :presence => true,})
end
