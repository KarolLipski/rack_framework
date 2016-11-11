# app.rb
Dir[File.join(File.dirname(__FILE__), 'lib', '*.rb')].each do |file|
  require file
end
Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
end

require 'yaml'
ROUTES = YAML.load(
  File.read(File.join(File.dirname(__FILE__), 'app', 'routes.yml'))
)

require './lib/router'

# App class
class App
  attr_reader :router
  def initialize
    @router = Router.new(ROUTES)
  end

  def call(env)
    result = router.resolve(env)
    [result.status, result.headers, result.content]
  end

  def self.root
    File.dirname(__FILE__)
  end
end
