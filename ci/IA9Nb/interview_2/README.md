Create a rate limiter
* this rate limiter should be set to have a limit of 5 requests every 5 seconds

Use Case #1:
* if a customer were to make 10 requests within the same second, the first 5 requests would be accepted and the last 5 requests would be rejected

Use Case #2:
* if within the first one second, the user were to make 6 request, the first 5 would be accepted and the 6th request would be rejected... now if we wait 5 seconds, then a new request would be accepted
