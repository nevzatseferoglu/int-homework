# frozen_string_literal: true

class Homework::API::Articles < Grape::API
  version 'v1', using: :path
  resource :articles do
    helpers Homework::Helpers::ParamsHelper

    desc 'Create a new article'
    params do
      use :article
    end
    post do
      present Article.create(declared(params)[:article])
    end

    desc 'Get a list of all articles'
    get do
      present Article.all
    end

    params do
      requires :article_id, type: Integer, desc: 'Article ID.'
    end
    route_param :article_id do
      helpers do
        def current_article
          Article.find(declared(params)[:article_id])
        end
      end

      desc "Delete an article"
      get :delete do
        present current_article.destroy
      end

      desc "Update an article's information"
      params do
        use :article
      end
      put do
        present current_article.update(declared(params)[:article])
      end

      desc 'Get authors of an article'
      get :authors do
        article = Article.find(declared(params)[:article_id])
        present article.authors
      end

      desc 'Add an author to an article'
      params do
        use :author
      end
      post :authors do
        article = Article.find(declared(params)[:article_id])
        author = Author.create(declared(params)[:author])
        article.authors << author
        present author
      end

      # Mounting the Authors API
      mount Homework::API::Authors
    end
  end
end
