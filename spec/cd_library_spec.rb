require('rspec')
require('cd_library')

describe(CD) do
  before() do
    CD.clear()
  end

  describe("#cd_name") do
    it("returns the name of the cd") do
      test_cd = CD.new({:cd_name => "Lady in Satin", :cd_artist => "Billy Holiday"})
      test_cd.save()
      expect(test_cd.cd_name()).to(eq("Lady in Satin"))
    end
  end

  describe("#cd_artist") do
    it("returns the name of the artist") do
      test_cd = CD.new({:cd_name => "Lady in Satin", :cd_artist => "Billy Holiday"})
      test_cd.save()
      expect(test_cd.cd_artist()).to(eq("Billy Holiday"))
    end
  end

  describe("#id") do
    it("returns the id of the cd") do
      test_cd = CD.new({:cd_name => "Lady in Satin", :cd_artist => "Billy Holiday"})
      expect(test_cd.id()).to(eq(1))
    end
  end

  describe("#save") do
    it("adds a cd to the array of saved cds") do
      test_cd = CD.new({:cd_name => "Lady in Satin", :cd_artist => "Billy Holiday"})
      test_cd.save()
      expect(CD.all()).to(eq([test_cd]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(CD.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties all of the save cds") do
      CD.new({:cd_name => "Lady in Satin", :cd_artist => "Billy Holiday"}).save()
      CD.clear()
      expect(CD.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns the cd by its id number") do
      test_cd = CD.new({:cd_name => "Lady in Satin", :cd_artist => "Billy Holiday"})
      test_cd.save()
      test_cd2 = CD.new({:cd_name => "Brothers", :cd_artist => "The Black Keys"})
      test_cd2.save()
      expect(CD.find(test_cd.id())).to(eq(test_cd))
    end
  end

  describe(".search") do
    it("searches for a cd by it's id number and returns the cd name and artist") do
      test_cd = CD.new({:cd_name => "Lady in Satin", :cd_artist => "Billy Holiday"})
      test_cd.save()
      test_cd2 = CD.new({:cd_name => "Brothers", :cd_artist => "The Black Keys"})
      test_cd2.save()
      expect(CD.search(test_cd)).to(eq(test_cd))
    end
  end
end
