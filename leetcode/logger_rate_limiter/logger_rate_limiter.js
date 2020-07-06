/**
 * Initialize your data structure here.
 */
var Logger = function () {
  this.messages_log = {};
};

/**
 * Returns true if the message should be printed in the given timestamp, otherwise returns false.
        If this method returns false, the message will not be printed.
        The timestamp is in seconds granularity.
 * @param {number} timestamp
 * @param {string} message
 * @return {boolean}
 */
Logger.prototype.shouldPrintMessage = function (timestamp, message) {
  if (this.messages_log.hasOwnProperty(message)) {
    if (this.messages_log[message] <= timestamp - 10) {
      this.messages_log[message] = timestamp;
      return true
    } else {
      return false
    }
  } else {
    this.messages_log[message] = timestamp;
    return true
  }
};

/**
 * Your Logger object will be instantiated and called as such:
 * var obj = new Logger()
 * var param_1 = obj.shouldPrintMessage(timestamp,message)
 */

const logger = new Logger();

// logging string "foo" at timestamp 1
console.log(logger.shouldPrintMessage(1, "foo") == true);

// logging string "bar" at timestamp 2
console.log(logger.shouldPrintMessage(2, "bar") == true);

// // logging string "foo" at timestamp 3
console.log(logger.shouldPrintMessage(3, "foo") == false);

// // logging string "bar" at timestamp 8
console.log(logger.shouldPrintMessage(8, "bar") == false);

// // logging string "foo" at timestamp 10
console.log(logger.shouldPrintMessage(10, "foo") == false);

// // logging string "foo" at timestamp 11
console.log(logger.shouldPrintMessage(11, "foo") == true);
