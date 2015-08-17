require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'fonts'
)

get '/' do 
	@font = Font.all
	@font.to_json  
end 

get '/api/fonts' do 
	Font.all.to_json 
end 

get '/api/fonts/:id' do 
	@font = Font.find(params[:id])
	@font.to_json
end 

post '/api/fonts' do 
	Font.create({
		:name => params[:name],
		:weight => params[:weight],
		:serif => params[:serif]
		}).to_json
end 

patch '/api/fonts/:id' do 
	font_args = { :name => params[:name], :weight => params[:weight], :serif => params[:serif] }

	@font = Font.find(params[:id])
	@font.update(font_args)
	@font.to_json
end 

put '/api/fonts/:id' do 
	font_args = { :name => params[:name], :weight => params[:weight], :serif => params[:serif] }

	@font = Font.find(params[:id])
	@font.update(font_args)
	@font.to_json
end 

delete '/api/fonts/:id' do 
	Font.destroy(params[:id]).to_json
end 






