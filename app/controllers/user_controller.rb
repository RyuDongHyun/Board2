class UserController < ApplicationController
  def admin
    @users=User.all
  end
  
  def edit
    @user=User.find(params[:id])
  end
  
  def update
    user=User.find(params[:id])
    user.update(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      )
    redirect_to '/user/admin'
  end
  
  def delete
    user=User.find(params[:id])
    user.destroy
    
    redirect_to '/user/admin'
  end
  
  def signup
  end
  
  def register
    unless User.find_by(email: params[:email])
      User.create(
        email: params[:email],
        password: params[:password],
        name: params[:name]
        )
      redirect_to '/user/success' and return
    end
    redirect_to '/user/signup'
    
  end
  
  
  
  
  def success
    if session[:current_user_id]
      redirect_to '/user/signup_success' and return
    else
      redirect_to '/user/success'
    end
  end

  def login
  end
  
  def login_chk
    users=User.all
    users.each do |u|
      if u.email==params[:email] and u.password==params[:password]
        session[:current_user_id] = u.id
        redirect_to '/posts/index' and return
      end
    end
    redirect_to '/user/login'
  end

  def logout
    session.clear
    redirect_to '/posts/index'
  end
  

end
