Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

#homesコントローラー
  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'

 #管理者側コントローラー
 namespace :admin do
   #get '/' => 'homes#top', as: '' 名前付きルートadmin_pathにしたければこれでも
   root to: 'homes#top'
   resources :items, only:[:index, :create, :new, :edit, :show, :update]
   resources :customers, only:[:index, :show, :edit, :update]
 end

end
