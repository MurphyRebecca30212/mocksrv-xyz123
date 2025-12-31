# Unit tests for MockServer class using Minitest framework
require 'minitest/autorun'
require_relative '../src/mock_server'

class MockServerTest < Minitest::Test
  def setup
    @server = MockServer.new
    @server.register_route('/api/test', '{"status": "success"}')
  end
 
  # Test for existing route returns correct response 
def test_existing_route_returns_response()
    assert_output(/Response for \/api\/test: {\\"status\\": \\\"success\\\"}/) { @server.call_api('/api/test') }
  end 
 
   # Test for non-existing route returns not found message 
def test_non_existing_route_returns_404()
    assert_output(/404 Not Found/) { @server.call_api('/api/invalid') }
  end 
end
