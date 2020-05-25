class Task::Operation::Delete < Trailblazer::Operation
  step Model(Task, :find)
  step Policy::Pundit(TaskPolicy, :destroy?)
  pass :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
