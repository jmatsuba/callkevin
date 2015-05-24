# Homepage (Root path)
enable :sessions

helpers do
  def user_logged_in?
    session[:auth_user] && session[:auth_user] != ''
  end
end

get '/?' do
  erb :'index'
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/register' do
  @user = User.new(
    email: params[:email],
    password: params[:password],
    handle:  params[:handle],
  )
  if @user.save
    session[:auth_user] = @user.id
    redirect '/'
  else
    erb :'index'
  end
end

get '/view' do
  @kevinrequests = KevinRequest.all
  erb :'view'
end


get '/kevinrequest/?' do
  erb :'success'
end

post '/kevinrequest/new' do
  @kevinrequest = KevinRequest.new(
    user_name: params[:name],
    title: params[:issue_title],
    description: params[:issue_desc],
    incentive:  params[:incentive],
  )
  if @kevinrequest.save
    erb :'success'
  else
    erb :'index'
  end
end


post '/login' do
  email = params[:email]
  password = params[:password]
  user_query = User.where(email: email)[0]

  #reject if user does not exist
  return erb :'login' if !user_query

  #check password if user exists
  if password == user_query.password
    session[:auth_user] = user_query.id
    session[:handle] = user_query.handle
    redirect '/'
  else
    erb :'index'
  end
end






