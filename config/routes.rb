Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

#customersコントローラー用
  get '/customers/mypage' => 'customers#show', as: 'mypage'
  get '/customers/edit/data' => 'customers#edit', as: 'customers_edit' #edit_customer_registration_pathとURLがかぶるため/customers/edit→/customers/edit/dataに変更
  patch 'customers' => 'customers#update', as: 'customers_update'
  get '/customers/check' => 'customers#check', as: 'customers_check'
  patch '/customers/withdrawal' => 'customers#withdrawal', as: 'withdrawal'

#エンドユーザー権限では、editはdeviseで標準であるものは使用しない。
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
