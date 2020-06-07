# api-platform-core-dev
[API Platform core](https://github.com/api-platform/core)
package development environment.

# Setup guide

1. Install `git`, `docker` and `docker-compose` if you don't have them yet.

2. Check setup requirements.

     ```
     bin/setup-check
     ```

3. Setup `.env` file based on `.env.dist`:

    Type `id` in console to get **PUID** and **GUID** , use them in `.env` file.

4. Clone your **fork** of api-platform/core.

     ```
     git clone your-fork code
     ```
     
5. Add api-platform/core repository.

     ```
     bin/git remote add upstream https://github.com/api-platform/core.git 
     ```

6. Build and run development environment.

     ```
     docker-compose up
     ```

7. Install api-platform/core dependencies.

     ```
     bin/composer install
     ```

8. Install a hook to run PHP Cs Fixer on committed files.
  
     ```
     bin/git config core.hooksPath ../.githooks
     ```
 
# Development

Read the [Contributing to API Platform](https://github.com/api-platform/core/blob/master/CONTRIBUTING.md).

Use `bin/git` instead of `git` when working on the API Platform code.  
Use `git` only to develop this development environment.

## Development environment container
To run a command in a running container:

    docker-compose exec php sh
    
## Disable git hooks locally

    bin/git config core.hooksPath .git/hooks

## Sync fork
Sync your fork with up to date api-platform/core repository.

    bin/git fetch upstream
    bin/git merge upstream/master
    bin/git push origin master
    
## Tests

### PHPUnit
Run all tests with default arguments.

    bin/phpunit
    
The same as above.

    bin/phpunit --stop-on-failure -vvv
    
Run tests in the selected directory.

    bin/phpunit tests/Action
    
Run the selected test.

    bin/phpunit --filter testInvalidFilter
    bin/phpunit --filter ApiFilterTest::testInvalidFilter
    
Run tests in the selected class.
    
    bin/phpunit --filter ApiFilterTest
    
Run tests from selected groups.
    
    bin/phpunit --group mongodb,legacy,time-sensitive,resource-hog
    
Run tests that are not in selected groups.
    
    bin/phpunit --exclude-group mongodb,legacy,time-sensitive,resource-hog

See more.

    bin/phpunit --help

### PHPUnit tests code coverage generation
Report about [Code Coverage Analysis](https://phpunit.readthedocs.io/en/8.0/code-coverage-analysis.html#code-coverage-analysis) will be in directory `coverage`.

    bin/coverage

### Behat
Run all tests with the default arguments.

    bin/behat
 
The same as above.

    bin/behat --profile=default --stop-on-failure --no-interaction -vv

Run tests by the profile.

    bin/behat --profile=default --stop-on-failure --no-interaction
    bin/behat --profile=default-legacy --stop-on-failure --no-interaction
    bin/behat --profile=postgres --stop-on-failure --no-interaction
    bin/behat --profile=mongodb --stop-on-failure --no-interaction
    bin/behat --profile=elasticsearch --stop-on-failure --no-interaction

    bin/behat --profile=default-coverage --stop-on-failure --no-interaction
    bin/behat --profile=default-legacy-coverage --stop-on-failure --no-interaction
    bin/behat --profile=mongodb-coverage --stop-on-failure --no-interaction
    bin/behat --profile=elasticsearch-coverage --stop-on-failure --no-interaction

Run tests in the selected directory.

    bin/behat --profile=default --stop-on-failure features/authorization

Run the selected feature.

    bin/behat --profile=default --stop-on-failure features/authorization/deny.feature

Run the selected scenario by line number.

    bin/behat --profile=default --stop-on-failure features/authorization/deny.feature:7

Run tests by scenario name.

    bin/behat --stop-on-failure --name "An anonymous user"

Print all available step definitions.

    bin/behat --profile=default -dl

See more.

    bin/behat --help
