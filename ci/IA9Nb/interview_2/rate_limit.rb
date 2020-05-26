require 'pry'
class Request

  attr_reader :customer_id, :created_at

  def initialize(customer_id)
    @customer_id = customer_id
    @created_at = Time.now
  end

end

class RateLimiter

  attr_reader :limit

  def initialize(limit)
    @limit = limit
    @requests = []
  end

end

class App

  def initialize(rate_limit: 5)
    @rate_limiter = RateLimiter.new(rate_limit)
    @requests = {}
  end

  def request(customer_id:)
    current_time = Time.now
    count_of_request_in_the_last_5_seconds = 0
    if @requests[customer_id]
      @requests[customer_id].each do |request|
        # Determine how many requests from the person have been made in the past 5 seconds
        if request.created_at > (current_time - 5)
          puts "Found a request within the last 5 seconds"
          count_of_request_in_the_last_5_seconds += 1
        else
          # we could potentially get rid of the request?
        end
      end
      if count_of_request_in_the_last_5_seconds >= @rate_limiter.limit
        puts "REJECTED REQUEST"
        return false
      end
      if @requests[customer_id]
        @requests[customer_id] << Request.new(customer_id)
      else
        @requests[customer_id] = []
      end
    else
      @requests[customer_id] = [Request.new(customer_id)]
    end
    puts "ACCEPTED REQUEST"
    return true
  end

end

app = App.new(rate_limit: 5)
app.request(customer_id: 1)
app.request(customer_id: 1)
app.request(customer_id: 1)
app.request(customer_id: 1)
app.request(customer_id: 1)
app.request(customer_id: 1)
app.request(customer_id: 1)
app.request(customer_id: 1)
sleep(5)
app.request(customer_id: 1)


# credit = 10
# limit = 5
# 20s
# current_allotted_limit = credit + limit
# MAKE 16 requests...
#   15 get through
#   1 gets rejected
# 5 seconds later, we increment their credit from 0 to 5
#   They would be able to make 10 requests...


