# Testbox

A place to send your non-production emails.

## Usage

1. Deploy the app and fill the environment variables (AWS S3 credentials are needed to store the emails)
[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/juanmanuelramallo/testbox)
1. Add a custom domain name to your app
1. Configure Sendgrid to be able to receive emails. https://docs.sendgrid.com/for-developers/parsing-email/setting-up-the-inbound-parse-webhook. (Testbox uses ActionMailbox to process emails https://guides.rubyonrails.org/action_mailbox_basics.html#sendgrid)
1. Send an email to your recently configured test inbox and it will appear in the app's dashbaord.
1. Visit your app. Use `testbox` as username and your USER_PASSWORD env var as password.

## How it works

Uses ActionMailbox to receive emais. Testbox is basically a user interface for ActionMailbox's InboundEmails.
