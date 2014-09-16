class Adults
  include Enumerable
  def initialize(*adults)
    @adults = adults
  end

  def each
    @adults.each do |adult|
      if adult.class == Person && adult.age > 17
        yield adult
      end
    end
  end
end