require "reform"
require "reform/form/dry"

module User::Contract
  class Create < Reform::Form
    include Dry

    property :username
    property :password

    # validates :username, length: 3..50

    validation do
      required(:username).filled(min_size?: 3, max_size?: 50)
      required(:pasword).filled(min_size?: 6)
    end
  end
end
