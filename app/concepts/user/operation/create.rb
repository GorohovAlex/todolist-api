# require_relative "../contract/create"

class User::Operation::Create < Trailblazer::Operation
  step Policy::Pundit(UserPolicy, :create?)
  step Model(User, :new)
  step Contract::Build(constant: User::Contract::Create)
  step Contract::Validate()
  # step :persist!
  step Contract::Persist()
  # step :notify!

  # def persist!(_options, model:, **)
    # model.update_attributes(params)
    # byebug
    # model.save
  # end

  # def notify!(options, **)
  #   options["result.notify"] = BlogPost::Notification.(current_user, model)
  # end
end
