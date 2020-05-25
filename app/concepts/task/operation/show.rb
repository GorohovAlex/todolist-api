class Task::Operation::Show < Trailblazer::Operation
  step Model(Task, :find)
  step Policy::Pundit(TaskPolicy, :show?)
end
