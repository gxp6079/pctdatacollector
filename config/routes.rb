Rails.application.routes.draw do

  resources :task_progresses, :except => [:new]

  resources :permanence_times, :except => [:new, :edit]

  resources :tasks

  resources :file_examples
  match 'file_examples/read_file', to: 'file_examples#read_file', via: [:post]

  resources :system_examples

  match 'task_activities/take', to: 'task_activities#take', via: [:get]
  match 'task_activities/retake', to: 'task_activities#retake', via: [:get]
  match 'task_activities/system_description', to: 'task_activities#system_description', via: [:get]
  match 'task_activities/finish', to: 'task_activities#finish', via: [:put]

  devise_for :users, path_names: {
    sign_up: ''
  }
  devise_scope :user do
    authenticated :user do
      root 'static_pages#home', as: :root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  scope '/admin' do
    resources :users
  end

  match 'download_tasks', to: 'static_pages#download_tasks', via: [:get]
  match 'task_activities/upload_tasks', to: 'task_activities#upload_tasks', via: [:post]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
