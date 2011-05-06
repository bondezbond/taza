require 'spec/spec_helper'
require 'ruby-debug'
describe "Site Specific Fixtures" do
  before do
  Taza::Fixture.stubs(:base_path).returns(File.join('.','spec','sandbox','fixtures',''))
  include Taza::Fixtures::FooSite
  end

  it "should be able to access fixtures in sub-folders" do
    bars(:foo).name.should eql("foo")
  end

  it "should not be able to access non-site-specific fixtures" do
    lambda{foos(:gap)}.should raise_error(NoMethodError)
  end
end
