# frozen_string_literal: true

# The Area we provide service in
class ServiceArea
  def initialize(**args)
    @postcode_allowed_list = args.fetch(:postcode_allowed_list, [])
    @lsoa_allowed_list = args.fetch(:lsoa_allowed_list, [])
  end

  def servable?(postcode)
    code = postcode.normalized
    postcode_allowed_list.include?(code) ||
      lsoa_allowed_list.include?(code)
  end

  private

  attr_reader :postcode_allowed_list, :lsoa_allowed_list

end
