# frozen_string_literal: true

class Reservation::VerifyToken < OptStruct.new
  required :signature, :verifier
  attr_reader :household

  def perform
    verify_and_set_household
    self
  end

  private

  def verify_and_set_household
    if signature.include?("+")
      email, id, klass = verifier.verify(CGI.unescape(signature).gsub!(" ", "+"))
    else
      email, id, klass = verifier.verify(CGI.unescape(signature))
    end
    @household = klass.constantize.find_by(id: id, email: email)
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end
end
