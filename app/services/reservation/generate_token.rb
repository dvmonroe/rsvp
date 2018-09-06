# frozen_string_literal: true

class Reservation::GenerateToken < OptStruct.new
  required :household, :verifier

  def perform
    generate_token
  end

  private

  def generate_token
    verifier.generate([household.email, household.id, "Household"])
  end
end
