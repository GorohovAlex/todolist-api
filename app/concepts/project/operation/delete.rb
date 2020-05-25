module Project::Operation
  class Delete < Trailblazer::Operation
    step Model(Project, :find)
    step Policy::Pundit(ProjectPolicy, :destroy?)
    pass :delete!

    def delete!(_options, model:, **)
      model.destroy
    end
  end
end
