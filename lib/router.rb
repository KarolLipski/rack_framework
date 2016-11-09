class Router
  attr_reader :routes
  
  def initialize(routes)
    @routes = routes
  end

  def resolve(env)
    path = env['REQUEST_PATH']
    if routes.key?(path) 
      #success route
      ctrl(routes[path]).call
    else
      # 404 controller
      Controller.new.not_found
    end
  rescue Exception => error
    puts error.message
    puts error.backtrace
    # internal error controller
    Controller.new.internal_error
  end


  def ctrl(string)
    ctrl_name, action_name = string.split('#')
    klass = Object.const_get("#{ctrl_name.capitalize}Controller")
    klass.new(name: ctrl_name, action: action_name.to_sym)
  end

end