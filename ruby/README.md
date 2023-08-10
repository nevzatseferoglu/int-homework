# About

This guide presents the `anynines` interview homework solution.

## Walkthrough of test execution steps

- Before appylying steps below; postgres native environmental veriable should be set as;
```
PG_CONTAINER_NAME='anynines-postgres-hw'
POSTGRES_DB='blog_db'
POSTGRES_USER='applicant'
POSTGRES_PASSWORD='temp123'
PGDATA='/data/postgres-hw'
```

- After `bundle install` instruction.
- Initiate test database inside local `docker` engine, it triggers `docker-compose`.
    - `rake docker:start_db` 
    - `rake docker:clean_db` cleans active containers and database volume.
- `rake db:migrate`
- `rake db:seed`
- `rake test`, it filter out the test and remove unnessary sections.
- Yard doc can be generated through `rake generate_docs`.

## Suggestions:

- Delete actions in the API could be implemented with HTTP DELETE method for convention.
- HTTP RFC standards should be checked and produce appropriate HTTP status code based on an action. Instead of returnin 500, more specific codes can be exploited.
But it can shape according to what info the API want to share with errors.
- Utilizing Grape's before hooks to encapsulate common logic helps avoid duplication.
```
before do
    @article = Article.find(declared(params)[:article_id])
end
```
- It can be created seperate module for handling `article` and `author` related endpoints and implementations.
- According to database scheme, schemecrawler can be exploited, we could ER diagram based on that.
- Coverage tool and tests can be integrated with GH action or other CI tools.
- API can be integrated with more advance authentication toolings such as `OAuth 2.0`, `JWT`.
- `rubocop` generates several `correctable` warnings, those warning can be autofix with CI pipeline or `rubocop` can
create a commit after each PR for keeping code more clean and valid for current ruby conventions.

## Submission Notes

- Exploited `solargraph` and `rubocop` for development and static code analyzer purposes.
- Created a `docker-compose` file for testing db functionality.
- Added new rake tests for the speed of developments.
- Resolved the tests accordint to spec/.
- Changed the ruby version `3.2.2`. The old version was not running on Apple Silicon. And also, it seems that the version reached end of life support out of security patches.


