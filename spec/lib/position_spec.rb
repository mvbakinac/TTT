require "position"
require "rspec/its"

describe Position do
  its(:board) { should == %w(-)*9 }
  its(:turn)  { should == "x" }
  
end
