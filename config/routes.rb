Rails.application.routes.draw do
  resources :psychologists, only: [] do
    resources :evaluateds, only: [:show] do
      post 'apply_instrument', to: 'psychologists#apply_instrument'
    end
    post 'create_evaluated', to: 'psychologists#create_evaluated'
  end

  resources :evaluateds, only: [] do
    get 'fill_data', to: 'evaluateds#fill_data'
    post 'start_instrument', to: 'evaluateds#start_instrument'
  end

  resources :instruments, only: [:show] do
    post 'submit_answers', to: 'instruments#submit_answers'
  end
end
