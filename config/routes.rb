Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               omniauth_callbacks: "users/omniauth_callbacks"
             },
             skip: %i[sessions registrations]

  devise_scope :user do
    resource :sessions, controller: "users/sessions", only: :destroy, as: :logout
  end

  root 'static_pages#landing_page'
end
