# frozen_string_literal: true

# Rails Top level Class for ApplicationRecord classes
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
