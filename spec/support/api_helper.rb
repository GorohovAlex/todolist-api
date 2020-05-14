module ApiHelper
  def authenticated_header(user)
    session = JWTSessions::Session.new(payload: { user_id: user.id }, refresh_by_access_allowed: true)
    { Authorization: session.login[:access] }
  end
end
