class TaskComment::Operation::Delete < Trailblazer::Operation
  step Model(TaskComment, :find)
  step Policy::Pundit(TaskCommentPolicy, :destroy?)
  pass :delete!

  def delete!(_options, model:, **)
    model.destroy
  end
end
