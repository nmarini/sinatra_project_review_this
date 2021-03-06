require_relative './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` or `rake db:migrate SINATRA_ENV=development` to resolve the issue.'
end

use Rack::MethodOverride
use UserController
use ReviewController
run ApplicationController
