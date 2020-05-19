class TaskComment::Operation::Delete < Trailblazer::Operation
  step Model(TaskComment, :find)
  step Policy::Pundit(TaskCommentPolicy, :destroy?)
  pass :delete!

  def delete!(_options, model:, **)
    TaskComment.destroy(model.id)
  end
end
