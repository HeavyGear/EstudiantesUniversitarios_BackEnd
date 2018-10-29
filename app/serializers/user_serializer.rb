# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  idNumber        :integer
#  email           :string
#  beneficiary     :boolean
#  password_digest :string
#  role_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :idnumber, :email, :password_digest, :beneficiary, :role_id

end
