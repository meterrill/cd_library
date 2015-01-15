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
end
