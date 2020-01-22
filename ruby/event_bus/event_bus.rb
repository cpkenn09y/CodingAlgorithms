class EventBus
  def initialize
    @error_callbacks = []
    @success_callbacks = []
  end

  def emit(event_name, data)
    case event_name
    when "error"
      @error_callbacks.each do |callback|
        callback.call(data)
      end
    when "success"
      @success_callbacks.each do |callback|
        callback.call(data)
      end
    else
      raise "event_bus#emit: invalid event name '#{event_name}'"
    end
  end

  def subscribe(event_name, callback)
    case event_name
    when "success"
      @success_callbacks << callback
    when "error"
      @error_callbacks << callback
    else
      raise "event_bus#subscribe: invalid event name '#{event_name}'"
    end
  end
end

emitter = EventBus.new
error_callback = proc { |data| puts "Error 1. #{data[:message]}" }
error_callback2 = proc { |data| puts "Error 2. #{data[:message]}" }
success_callback = proc { |data| puts "SUCCESS! #{data[:message]}" }

emitter.emit "error", { message: "Error one." }

emitter.subscribe "error", error_callback
emitter.emit "error", { message: "Second error." }

emitter.subscribe "error", error_callback2
emitter.emit "error", { message: "Yet another error." }

emitter.subscribe "success", success_callback
emitter.emit "success", { message: "Great success!" }

# Expected output:

# Error 1. Second error.
# Error 1. Yet another error.
# Error 2. Yet another error.
# SUCCESS! Great success!
