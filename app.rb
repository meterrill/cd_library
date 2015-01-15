require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/cd_library.rb')

get('/') do
  @cds = CD.all()
  erb(:index)
end

post('/cd_library')do
  @cd_name = params.fetch("cd_name")
  @cd_artist = params.fetch("cd_artist")
  cd = CD.new({:cd_name => @cd_name, :cd_artist => @cd_artist})
  cd.save()
  @cds = CD.all()
  erb(:index)
end

get('/cd_library/:id') do
  @cd = CD.find(params.fetch("id").to_i())
  erb(:results)
end
