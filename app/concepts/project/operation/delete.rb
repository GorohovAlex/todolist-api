module Project::Operation
  class Delete < Trailblazer::Operation
    step Model(Project, :find)
    step Policy::Pundit(ProjectPolicy, :destroy?)
    step :delete!

    def delete!(options, model:, **)
      model.destroy
    end
  end
end
