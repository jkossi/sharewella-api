# frozen_string_literal: true

# Mark existing migrations as safe
StrongMigrations.start_after = 20230813000000

# Set timeouts for migrations
# If you use PgBouncer in transaction mode, delete these lines and set timeouts on the database user
StrongMigrations.lock_timeout = 10.seconds
StrongMigrations.statement_timeout = 60.seconds

# Analyze tables after indexes are added
# Outdated statistics can sometimes hurt performance
StrongMigrations.auto_analyze = true

StrongMigrations.alphabetize_schema = true

# Set the version of the production database
# so the right checks are run in development
StrongMigrations.target_version = 15

# Add custom checks
# StrongMigrations.add_check do |method, args|
#   if method == :add_index && args[0].to_s == "users"
#     stop! "No more indexes on the users table"
#   end
# end

# Make some operations safe by default
# See https://github.com/ankane/strong_migrations#safe-by-default
StrongMigrations.safe_by_default = true
