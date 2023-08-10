# About

This document provides details about the solution for the anynines interview homework.

## Walkthrough of test execution steps

- Before proceeding with the steps below, make sure to set the following PostgreSQL environment variables natively:
```bash
export PG_CONTAINER_NAME='anynines-postgres-hw'
export POSTGRES_DB='blog_db'
export POSTGRES_USER='applicant'
export POSTGRES_PASSWORD='temp123'
export PGDATA='/data/postgres-hw'
```

- After executing the `bundle install` command, follow these steps to execute the tests:
- Initialize the test database within local `docker` engine, this action triggers `docker-compose`.
    - `rake docker:start_db` 
    - `rake docker:clean_db` to clean active containers and database volume.
- Perform database migrations: Run `rake db:migrate`.
- Seed the database: Run `rake db:seed`.
- Execute the tests: Run `rake test`. This command filters the tests and removes unnecessary sections.
- Generate Yard documentation: Utilize `rake generate_docs` to generate the documentation.

## Suggestions:

Here are some suggestions for improving the project:

- Implement delete actions in the API using the HTTP DELETE method for consistency.
- Check HTTP RFC standards and implement appropriate HTTP status codes based on business logic.
- Utilize Grape's before hooks to encapsulate common logic and prevent duplication.
```
before do
    @article = Article.find(declared(params)[:article_id])
end
```
- Create separate modules for handling article and author related endpoints and implementations.
- Consider using schemecrawler to generate an ER diagram based on the database schema.
- Integrate a coverage tool and tests into GitHub Actions or other CI tools.
- Enhance API security by integrating more advanced authentication mechanisms such as `OAuth 2.0` or `JWT`.
- Address `rubocop` warnings by incorporating them into the CI pipeline or automating fixes after pull requests to maintain clean and compliant code with current Ruby conventions.


## Submission Notes

The development process included the following steps:

- Utilized `solargraph` and `rubocop` for development and static code analysis.
- Created a `docker-compose` file to facilitate testing of database functionality.
- Added new `rake` tests to expedite development.
- Resolved test issues according to the specifications in the `spec/` directory.
- Upgraded the Ruby version to `3.2.2` to ensure compatibility with Apple Silicon and to receive necessary security patches, as the previous version had reached end-of-life support.
