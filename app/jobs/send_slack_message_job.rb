class SendSlackMessageJob < ApplicationJob
  queue_as :default

  def perform(slack_channel, message)
    notifier = Slack::Notifier.new(ENV['SLACK_INCOMING_WEBHOOK_URL'], channel: slack_channel, username: "Mixrelay System")
    notifier.ping(message)
  end
end
