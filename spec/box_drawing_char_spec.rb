require "spec_helper"

RSpec.describe BoxDrawingChar do
  it "has a version number" do
    expect(BoxDrawingChar::VERSION).not_to be nil
  end

  it "add" do
    a = BoxDrawingChar::Char.new(?└)#
    b = BoxDrawingChar::Char.new(?┘)
    expect((a + b).to_s).to eq(?┴)
  end

end
