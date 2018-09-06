class ReservationsController < ApplicationController
  before_action :set_signature, except: :index
  before_action :find_household, except: :index
  before_action :check_confirmation_approval, only: :show

  def index
    not_found
  end

  def show
  end

  def update
    _update_reservation
    redirect_to reservation_path(@household.token)
  end

  private

  def check_confirmation_approval
    @confirmation_page = session[:confirmation_page] ? true : false
    session.delete(:confirmation_page)
  end

  def household_params
    params.require(:household).permit(:attendance,
      :contact_preference,
      attendees: [], events: {}, contact: {})
  end

  def find_household
    @household = _verified&.household or not_found
  end

  def set_signature
    @signature = params[:id]
  end

  def _update_reservation
    Reservation::Updater.new(
      params: household_params.to_h,
      household: @household
    ).perform
    session[:confirmation_page] = true
  end

  def _verified
    Reservation::VerifyToken.new(
      signature: @signature,
      verifier: Household.verifier
    ).perform
  end
end
