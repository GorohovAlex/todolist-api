class Session::Operation::Delete < Trailblazer::Operation
  step :sign_out!

  def sign_out!(_options, payload:, **)
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
  end
end
