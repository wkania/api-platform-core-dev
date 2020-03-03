# api-platform-core-dev
[API Platform core](https://github.com/api-platform/core)
package development environment.

# Setup guide

1. Install `git`, `docker` and `docker-compose` if you don't have them yet.

2. Setup `.env` file based on `.env.dist`:

    Type `id` in console to get **PUID** and **GUID** , use them in `.env` file.

3. Clone your **fork** of api-platform/core.

     ```
     git clone your-fork code
     ```
     
4. Build and run development environment.

     ```
     docker-compose up
     ```

5. Install api-platform/core dependencies.

     ```
     bin/composer install
     ```

# Development

Read the [Contributing to API Platform](https://github.com/api-platform/core/blob/master/CONTRIBUTING.md).

## Development environment container
To run a command in a running container:

    docker-compose exec php sh
