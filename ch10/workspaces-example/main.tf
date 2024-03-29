provider "aws" {
  region = "us-east-1"
}

locals {
  queue_prefix = "${terraform.workspace}"
}

resource "aws_sqs_queue" "main_queue" {
  name = "${local.queue_prefix}-accounting-stmt-queue"

  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq_queue.arn
    maxReceiveCount     = 4
  })
}

resource "aws_sqs_queue" "dlq_queue" {
  name = "${local.queue_prefix}-accounting-stmt-dlq"
}

resource "aws_sqs_queue_redrive_allow_policy" "queue_redrive_policy" {
  queue_url = aws_sqs_queue.dlq_queue.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.main_queue.arn]
  })
}