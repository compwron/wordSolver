require_relative "../lib/foo"

describe Foo do

  subject { Foo.new }

  before do
  end

  describe "#method_name" do
    it "should do stuff because x" do
    	subject.method_name.should == "value"
    end
end
