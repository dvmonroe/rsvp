class BaseMailerPreview < ActionMailer::Preview
  def confirmation
    BaseMailer.with(household: Household.first).confirmation
  end

  def invite
    BaseMailer.with(household: Household.first).invite
  end

  def invite_reminder
    BaseMailer.with(household: Household.first).invite_reminder
  end

  def event_schedule
    BaseMailer.with(household: Household.first).event_schedule
  end
end
