class Project
  class Contract::Base < Reform::Form
    property :name
    property :user_id

    validates :name, presence: true
    validates :user_id, presence: true
  end
end
