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

get '/logout/?' do
  session[:auth_user] = ''
  redirect '/'
end


get '/email' do
  email do
    from "mailer@callkevin.ca"
    to "james.matsuba@gmail.com"
    subject "Welcome!"
    body render('email/registered')
    via :sendmail
  end
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

get '/kevinrequest/?' do
  @kevinrequests = KevinRequest.all
  erb :'success'
end

post '/kevinrequest/new' do
  @kevinrequest = KevinRequest.new(
    name: params[:issue_title],
    description: params[:issue_desc],
    incentive:  params[:incentive],
  )
  if @kevinrequest.save
     erb :'sendit'
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






