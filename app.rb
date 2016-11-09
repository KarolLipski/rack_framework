class App
  def call(env)
    [200,{},["#{env}"]]
  end
end