require 'bundler'
Bundler.require 

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'color'
)

get '/' do 
	@colors = Color.all 
	@colors.to_json 
end 

get '/api/colors' do 
	Color.all.to_json
end 

get '/api/colors/:id' do 
	@color = Color.find(params[:id])
	@color.to_json
end 

post '/api/colors' do 
	Color.create({
		:name => params[:name],
		:hex => params[:hex],
		:rgb => params[:rgb],
		:hsl => params[:hsl]
		})
end 

patch '/api/colors/:id' do 
	color_args = { :name => params[:name],
								 :hex => params[:hex],
								 :rgb => params[:rgb],
								 :hsl => params[:hsl]
								}
	@color = Color.find(params[:id])
	@color.update(color_args)
	@color.to_json
end 

put '/api/colors/:id' do 
	color_args = { :name => params[:name],
								 :hex => params[:hex],
								 :rgb => params[:rgb],
								 :hsl => params[:hsl]
								}
	@color = Color.find(params[:id])
	@color.update(color_args)
	@color.to_json
end 

delete '/api/colors/:id' do 
	Color.destroy(params[:id]).to_json
end 