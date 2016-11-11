# database config
config_db_file = File.join(
  File.dirname(__FILE__), '..', 'app', 'db', 'config.yml'
)
if File.exist?(config_db_file)
  config = YAML.load(File.read(config_db_file))
  DB = Sequel::connect(config)
  Sequel::extension :migration
end

# connect all framework files
Dir[File.join(File.dirname(__FILE__), '..', 'lib', '*.rb')].each do |file|
  require file
end
Dir[File.join(File.dirname(__FILE__), '..', 'app', '**', '*.rb')].each do |file|
  require file
end

# running migrations
if DB
  Sequel::Migrator.run(
    DB, File.join(File.dirname(__FILE__), '..', 'app', 'db', 'migrations')
  )
end

# reading routes
ROUTES = YAML.load(
  File.read(File.join(File.dirname(__FILE__), '..', 'app', 'routes.yml'))
)
