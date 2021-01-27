# frozen_string_literal: true

# Methods used by postcodes controller
module PostcodesHelper
  def servable_message(postcode)
    case Rails.configuration.service_area.servable?(postcode)
    when true
      served_message(@raw_postcode)
    else
      not_served_message(@raw_postcode)
    end
  end

  def served_message(raw_postcode)
    "Good news. #{raw_postcode} is in our service area"
  end

  def not_served_message(raw_postcode)
    "Sorry #{raw_postcode} is not in our service area"
  end
end
