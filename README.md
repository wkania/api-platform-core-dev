# api-platform-core-dev
[API Platform core](https://github.com/api-platform/core)
package development environment.

# Contents

- [Setup guide](#setup-guide)
- [Development](#development)
  - [Development environment container](#development-environment-container)
  - [Disable git hooks locally](#disable-git-hooks-locally)
  - [Sync fork](#sync-fork)
  - [Static Analysis Tool](#static-analysis-tool)
    - [PHPStan](#phpstan)
  - [Tests](#tests)
    - [PHPUnit](#phpunit)
    - [PHPUnit tests code coverage generation](#phpunit-tests-code-coverage-generation)
    - [Behat](#behat)

# Setup guide

1. Install `git`, `docker` and `docker-compose` if you don't have them yet.

2. Check setup requirements.

     ```
     bin/setup-check
     ```

3. Setup `.env` file based on `.env.dist`:

    Type `id` in console to get **PUID** and **GUID** , use them in `.env` file.  
    Add remote url to your **fork** of api-platform/core in **FORK_REMOTE_URL** env.

4. Build and run development environment.

     ```
     docker-compose up
     ```

5. Run all-in-one install command or steps from 6 to 10.

     ```
     bin/install
     ```

6. Clone your **fork** of `api-platform/core`.

     ```
     git clone your-fork-remote-url code
     ```

7. Install `api-platform/core` dependencies.

     ```
     bin/composer install
     bin/phpunit install
     ```

8. Add `api-platform/core` repository.

     ```
     bin/git remote add upstream https://github.com/api-platform/core.git
     ```

9. Install a hook to run PHP Cs Fixer on committed files.
  
     ```
     bin/git config core.hooksPath ../.githooks
     ```
 
10. Check installation.

     ```
     bin/installation-check
     ```
    
11. Install `api-platform/core` dependencies for the PHP 7.1 (optionally).

     ```
     bin/install-7-1
     ```
    
12. Install `api-platform/core` dependencies for the PHP 8 (optionally). Not supported yet.

     ```
     bin/install-8
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

The same as above in all-in-one command.

    bin/sync-fork

## Switch PHP version.
Default is 7.2.  
Add to the command: --php-ver=7.1 or --php-ver=8  
Supported by:
- bin/behat
- bin/composer
- bin/coverage
- bin/phpunit

## Static Analysis Tool

### PHPStan
Run with default arguments.

    bin/phpstan
    
The same as above.

    bin/phpstan analyse -c phpstan.neon.dist

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

Run tests from selected tags.
    
    bin/behat --profile=postgres --tags postgres
    bin/behat --tags sqlite,createSchema,dropSchema

Run tests that are not in selected tags.
    
    bin/behat --tags '~createSchema'

Print all available step definitions.

    bin/behat --profile=default -dl

See more.

    bin/behat --help
