class CD
  @@CD = []

  attr_reader(:cd_name, :cd_artist)


  define_method(:initialize) do |attributes|
    @cd_name = attributes.fetch(:cd_name)
    @cd_artist = attributes.fetch(:cd_artist)
  end

  define_singleton_method(:all) do
    @@CD
  end

  define_method(:save) do
    @@CD.push(self)
  end

  define_singleton_method(:clear) do
    @@CD = []
  end


end
