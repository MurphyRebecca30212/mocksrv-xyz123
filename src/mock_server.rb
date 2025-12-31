# MockServer class to simulate API responses
class MockServer
  def initialize
    @routes = {}
  end

  # Method to register a new route with a response
  def register_route(path, response)
    @routes[path] = response
  end

  # Method to simulate an API call and return the response
  def call_api(path)
    if @routes.key?(path)
      puts "Response for #{path}: #{@routes[path]}"
    else
      puts "404 Not Found"
    end
  end
end

# Example usage of the MockServer class
test_server = MockServer.new
test_server.register_route('/api/user', '{"name": "John Doe", "age": 30}')
test_server.call_api('/api/user')
test_server.call_api('/api/unknown')
