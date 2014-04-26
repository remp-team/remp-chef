require 'spec_helper'

describe package('supervisor') do
  it { should be_installed }
end

