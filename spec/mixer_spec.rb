require_relative "../lib/mixer"

describe Mixer do

  subject { Mixer.new 4, ["C", "A", "P", "E"] }

  it "should get possibles" do
  	subject.possibles.size.should == 14
  end

  it "possibles should include expered word 'cape'" do
  	subject.possibles.should include "cape"
  end

  it "should find results for passed-in lowercase letters also" do
  	lowercase_mixer = Mixer.new 4, ["c", "a", "p", "e"]
  	lowercase_mixer.possibles.size.should == 14
  end
end
