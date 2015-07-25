Rails.application.routes.draw do

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'  
  
  resources :users
  resources :password_resets
  resources :people 

  get 'people/contact_details/:id' => 'people#show_contact_details', as: 'contact_details'
  get 'people/contact_details/:id/edit' => 'people#edit_contact_details', as: 'edit_contact_details'
  patch 'people/contact_details/:id' => 'people#update_contact_details'
  put 'people/contact_details/:id' => 'people#update_contact_details'
  
  get 'people/job_details/:id' => 'people#show_job_details', as: 'job_details'
  get 'people/job_details/:id/edit' => 'people#edit_job_details', as: 'edit_job_details'
  patch 'people/job_details/:id' => 'people#update_job_details'
  put 'people/job_details/:id' => 'people#update_job_details'

  get 'people/pay_details/:id' => 'people#show_pay_details', as: 'show_pay_details'
  get 'people/reports_to_details/:id' => 'people#show_reports_to_details', as: 'reports_to_details'
  get 'people/emergency_contact_details/:id' => 'people#show_emergency_contact_details', as: 'emergency_contact_details'
  get 'people/dependent_details/:id' => 'people#show_dependent_details', as: 'dependent_details'
  get 'people/qualifications/:id' => 'people#show_qualifications', as: 'qualifications'

  resources :phone_numbers
  resources :email_addresses
  resources :job_titles
  resources :departments
  resources :locations
  resources :pay_details
  resources :reporting_relationships
  resources :emergency_contacts
  resources :dependents
  resources :person_skills
  resources :person_educations
  resources :person_languages
  resources :person_certifications
  resources :translations
  resources :person_terminations
  resources :job_detail_histories

  get 'dashboard/index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'dashboard#index'

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
