helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end
end

def humanized_time_ago(time_ago_in_minutes)
  if time_ago_in_minutes >= 60
    "#{time_ago_in_minutes / 60} hours ago"
  else
    "#{time_ago_in_minutes} minutes ago"
  end
end

get '/' do
  @finstagram_posts = FinstagramPost.order(created_at: :desc)
  erb(:index)
end
 
get '/login' do    # when a GET request comes into /login
  erb(:login)      # render app/views/login.erb

end

get '/signup' do     # if a user navigates to the path "/signup",
  @user = User.new   # setup empty @user object
  erb(:signup)       # render "app/views/signup.erb"
end


post '/login' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)  

  if user && user.password == password
    session[:user_id] = user.id
    redirect to('/')
  else
    @error_message = "Login failed."
    erb(:login)
  end
end



post '/login' do
  username = params[:username]
  password = params[:password]

  @user = User.find_by(username: username)

  if @user && @user.password == password
    session[:user_id] = @user.id
    "Success! User with id #{session[:user_id]} is logged in!"
  else
    @error_message = "Login failed."
    erb(:login)
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect to('/')
end

