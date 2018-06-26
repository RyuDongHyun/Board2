Rails.application.routes.draw do
  get 'posts/index'

  get 'posts/new'
  get 'posts/register' 

  get 'posts/show/:id' => 'posts#show'
  get 'posts/delete/:id' => 'posts#delete'
  get 'posts/edit/:id' => 'posts#edit'
  get 'posts/update/:id' => 'posts#update'

  get '/' => 'posts#index'
  
  get 'user/admin'
  get 'user/edit/:id' => 'user#edit'
  get 'user/update/:id'=> 'user#update'
  get 'user/delete/:id' => 'user#delete'
  
  get 'user/signup'
  get 'user/success'
  get 'user/signup_success'
  get 'user/register'

  get 'user/login'
  get 'user/login_chk'

  get 'user/logout'

end
