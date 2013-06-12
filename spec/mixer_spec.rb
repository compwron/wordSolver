require_relative "../lib/mixer"

describe Mixer do

  subject { Mixer.new 4, ["C", "A", "P", "E"] }

  it "should get possibles" do
  	subject.possibles.size.should == 14
  end

  it "possibles should include expered word 'cape'" do
  	subject.possibles.should include "cape"
  end
end
