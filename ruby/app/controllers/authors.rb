# frozen_string_literal: true

class Homework::API::Authors < Grape::API
  version 'v1', using: :path
  resource :authors do
    helpers Homework::Helpers::ParamsHelper

    desc 'Create a new author'
    params do
      use :author
    end
    post do
      present Author.create(declared(params)[:author])
    end

    desc 'Get a list of all authors'
    get do
      present Author.all
    end

    params do
      requires :author_id, type: Integer, desc: 'Author ID.'
    end
    route_param :author_id do
      desc 'Delete an author'
      get :delete do
        present current_author.destroy
      end

      desc 'Update an author\'s information'
      params do
        use :author
      end
      put do
        if current_author.update(declared(params)[:author])
          present true
        else
          error!('Failed to update author', 400)
        end
      end
    end
  end
end
