require 'rails_helper'

RSpec.describe Kitten, type: :model do
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :cuteness }
    it { should validate_presence_of :softness }
  end
end
