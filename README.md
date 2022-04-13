# aws-chatbot-slack-notification-channel
Integrating AWS Chatbot with Slack Notifications Channel

## Documentation
[Terraform Module to Implement Slack Notification Channel Using AWS Chatbot & SNS](https://dev.to/noyonict/terraform-module-to-implement-slack-notification-channel-using-aws-chatbot-sns-4afb)

## Usages
Define your module like this:

```
provider "aws" {
  region     = "eu-west-1"
  access_key = "AWS-ACCESS-KEY"
  secret_key = "AWS-SECRET-ACCESS-KEY"
}


module "chatbot-slack-channel" {
  source             = "git@github.com:noyonict/aws-chatbot-slack-channel.git"
  configuration_name = "alerts_test_aws"
  slack_channel_id   = "A2C4E6G8I0K"
  slack_workspace_id = "Z1Y2X3W4V"
}
```
**_configuration_name*_**: The name of the configuration/slack channel. Member must satisfy regular expression pattern: [a-zA-Z][-a-zA-Z0-9]*. For example: `alerts_test_aws`

**_slack_channel_id*_**: The ID of the Slack channel. To get the ID, open Slack, right click on the channel name in the left pane, then choose Copy Link. The channel ID is the 9-character string at the end of the URL. For example: `A2C4E6G8I0K`

**_slack_workspace_id*_**: The ID of the Slack workspace authorized with AWS Chatbot. To get the workspace ID, you must perform the initial authorization flow with Slack in the AWS Chatbot console. Then you can copy and paste the workspace ID from the console. For example: `Z1Y2X3W4V`

**_logging_level_**: Specifies the logging level for this configuration. This property affects the log entries pushed to Amazon CloudWatch Logs. Logging levels include ERROR, INFO, or NONE. `Default: ERROR`

**_tags_**: Additional tags (e.g. `map('BusinessUnit','XYZ'). Default: 
```
 {
   "Terraform" : true
 }
```

> Note: Required Terraform version >= 0.12 and also you can provide the AWS access details or it will using the default configuration.

Then open Terminal in the Module location:

`terraform init`
then

`terraform plan`
then

`terraform apply --auto-approve`

You will see this message:
> Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

It will create a `SNS topic`, a `IAM role`, Configured the `slack channel to Chatbot` and also will create a `sns-topic Subscriptions` for this Slack chennel.

