require 'spec_helper'
describe String do
  it { should respond_to(:gsub) }
end