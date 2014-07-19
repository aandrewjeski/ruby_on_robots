require 'artoo'

connection :sphero, :adaptor => :sphero, :port => '/dev/tty.Sphero-WGO-AMP-SPP-1'
device :sphero, :driver => :sphero


work do
  @count = 1
  @degree = 0
  @time = 1.seconds.to_f
  @time = @time/10

  every(@time) do
    sphero.set_color(@count % 5 == 0 ? :green : :blue)
    @count += 1
    sphero.roll 60, @degree
    @degree += 10
  end
end
