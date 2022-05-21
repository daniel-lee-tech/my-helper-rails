# My Helper Rails

## Tests

### Integration Tests

Integration tests are ran using capybara, rspec, and selenium.

To run tests locally:

```
docker-compose run --rm -e RAILS_ENV=test web bin/rails spec:system
```
