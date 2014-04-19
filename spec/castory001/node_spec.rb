require 'spec_helper'

describe package('nodejs') do
  it { should be_installed }
end

describe file('/usr/bin/grunt') do
  it { should be_file }
  it { should be_executable }
end

describe port(3030) do
  it { should be_listening }
end

