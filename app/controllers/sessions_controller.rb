require 'pry-rails'
class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if params[:user][:password] == user.password
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      session[:user_id] = nil
      redirect_to action: 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to user_path
  end

#   describe 'post create' do
#     it 'logs you in with the correct password' do
#       post :create, user: {name: connie.name, password: connie.password}
#       expect(session[:user_id]).to eq(connie.id)
#     end
#
#     it 'rejects invalid passwords' do
#       post :create, user: {name: connie.name, password: connie.password + 'x'}
#       expect(session[:user_id]).to be_nil
#     end
#
#     it 'rejects empty passwords' do
#       post :create, user: {name: connie.name, password: ''}
#       expect(session[:user_id]).to be_nil
#     end
#   end
# end

end
