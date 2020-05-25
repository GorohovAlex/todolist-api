class Task::Operation::Update < Trailblazer::Operation
  step Model(Task, :find)
  step Policy::Pundit(TaskPolicy, :update?)
  step Contract::Build(constant: Task::Contract::Base)
  step Contract::Validate(key: :task)
  step Contract::Persist()
end
