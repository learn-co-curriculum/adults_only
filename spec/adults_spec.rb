require 'spec_helper'
describe Adults do
  before do
    dog1 = Dog.new(15)
    dog2 = Dog.new(31)
    dog3 = Dog.new(12)
    dog4 = Dog.new(5)
    person1 = Person.new(2)
    person2 = Person.new(20)
    person3 = Person.new(18)
    person4 = Person.new(5)
    @adults = Adults.new(dog1, dog2, dog3, dog4, person1, person2, person3, person4)
  end

  it "defines an each method" do
    expect(@adults).to respond_to(:each)
  end

  it "mixes in the Enumerable Module" do
    expect(Adults.ancestors).to include(Enumerable)
  end

  it "Only yields Person objects" do
    # By mixing in Enumerable we get access to the none? method
    # Don't write this yourself
    expect(@adults.any?{|adult| adult.class == Dog }).to be_falsey
  end

  it "Only yields people over 18" do
    expect(@adults.select{|adult| adult.age > 17 }.count).to eq(2)
  end
end