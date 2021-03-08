module Project::Operation
  class Index < Trailblazer::Operation
    step Policy::Pundit(ProjectPolicy, :index?)
    step :model!

    def model!(options, current_user:, **)
      options[:model] = Pundit.policy_scope(current_user, Project)
    end
  end
end
