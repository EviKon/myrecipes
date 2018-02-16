require 'rails_helper'

RSpec.describe Chef do
  let(:chef) { Chef.new }

  subject { chef }

  it { is_expected.to have_many(:recipes).dependent(:destroy) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }
  it { is_expected.to have_many(:messages).dependent(:destroy) }
  it { is_expected.to validate_presence_of(:chefname) }
  it { is_expected.to validate_length_of(:chefname).is_at_most(30)}
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_length_of(:password).is_at_least(5) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_most(255) }
end
