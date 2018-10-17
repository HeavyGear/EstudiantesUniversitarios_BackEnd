# == Schema Information
#
# Table name: users
#
#  id          :integer          not null, primary key
#  name        :string
#  idNumber    :integer
#  email       :string
#  beneficiary :boolean
#  role_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :idNumber, :email, :beneficiary, :role_id

end
