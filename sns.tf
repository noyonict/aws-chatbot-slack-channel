resource "aws_sns_topic" "chatbot_sns_topic" {
  name = "${var.configuration_name}-sns-topic"

  tags = var.tags
}
