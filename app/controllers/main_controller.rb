class MainController < Controller
  def index
    @test = 'First test string'
    @arr = %w(first second)
  end
end