require 'rails_helper'

RSpec.describe Card, type: :model do
  belongs_to :user, optional: true
end
