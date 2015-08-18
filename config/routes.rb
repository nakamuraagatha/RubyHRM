Rails.application.routes.draw do

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'  
  
  resources :users
  resources :password_resets

  resources :people do
    resources :pay_details
  end

  get 'person/contact_details/:id' => 'people#show_contact_details', as: 'contact_details'
  get 'person/contact_details/:id/edit' => 'people#edit_contact_details', as: 'edit_contact_details'
  patch 'person/contact_details/:id' => 'people#update_contact_details'
  put 'person/contact_details/:id' => 'people#update_contact_details'

  get 'person/job_details/:id' => 'people#show_job_details', as: 'job_details'
  get 'person/job_details/:id/edit' => 'people#edit_job_details', as: 'edit_job_details'
  patch 'person/job_details/:id' => 'people#update_job_details'
  put 'person/job_details/:id' => 'people#update_job_details'

  get 'person/reports_to_details/:id' => 'people#show_reports_to_details', as: 'reports_to_details'
  get 'person/emergency_contact_details/:id' => 'people#show_emergency_contact_details', as: 'emergency_contact_details'
  get 'person/dependent_details/:id' => 'people#show_dependent_details', as: 'dependent_details'

  get 'person/qualifications/:id' => 'people#show_qualifications', as: 'qualifications'

  resources :phone_numbers
  resources :email_addresses
  resources :job_titles
  resources :departments
  resources :locations
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
  resources :system_languages
  resources :languages
  resources :skills
  resources :certifications
  resources :education_levels
  resources :countries
  resources :states
  resources :termination_reasons
  resources :pay_grades

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
