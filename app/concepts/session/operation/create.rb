class Session::Operation::Create < Trailblazer::Operation
  step :model!
  step :authenticate!
  fail :authenticate_error!
  step :session!

  def model!(options, params:, **)
    options[:model] = User.find_by!(username: params[:username])
  end

  def authenticate!(_options, params:, model:, **)
    model.authenticate(params[:password])
  end

  def authenticate_error!(options, **)
    options[:errors] = { user: I18n.t('errors.username_and_password') }
  end

  def session!(options, model:, **)
    session = JWTSessions::Session.new(payload: { user_id: model.id }, refresh_by_access_allowed: true)
    options[:session] = session.login
  end
end
