# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  saving_id  :integer
#  target_id  :integer
#
class Link < ApplicationRecord
end
