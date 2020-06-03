## Fluentd logs parser 
This is our flunetd parser that recives log from a nats que.
Then parses the log to make them inte a json format.

The logs are then sent to diffrent endpoints for storage example Elastic and s3