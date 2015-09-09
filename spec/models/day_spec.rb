require 'rails_helper'

describe Day do
  it { should validate_presence_of :description }
  it { should validate_presence_of :date }
  it { should validate_presence_of :link_to }

end
