class CD
  @@cds = []

  attr_reader(:cd_name, :cd_artist)

  define_method(:initialize) do |attributes|
    @cd_name = attributes.fetch(:cd_name)
    @cd_artist = attributes.fetch(:cd_artist)
    @id = @@cds.length().+(1)
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@cds
  end

  define_method(:save) do
    @@cds.push(self)
  end

  define_singleton_method(:clear) do
    @@cds = []
  end

  define_singleton_method(:find) do |identification|
    found_cd = nil
    @@cds.each() do |cd|
      if cd.id().eql?(identification.to_i())
        found_cd = cd
      end
    end
    found_cd
  end
end
