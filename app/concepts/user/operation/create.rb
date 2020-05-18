class User::Operation::Create < Trailblazer::Operation
  step Policy::Pundit(UserPolicy, :create?)
  step Model(User, :new)
  step Contract::Build(constant: User::Contract::Create)
  step Contract::Validate(key: :user)
  step Contract::Persist()
end
