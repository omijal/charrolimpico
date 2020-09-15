require_relative 'lib/omega'
require 'telegram/bot'
require 'yaml'

config = {
  'telegram' => ENV['CHARROBOT_TELEGRAM'],
  'omega' => {
    'endpoint' => 'https://omegaup.com',
    'user' => 'charrobot',
    'pass' => ENV['CHARROBOT_OMEGAUP']
  }
}

bot = Telegram::Bot::Client.new(config['telegram'])

omega = Omega::Client.new(config['omega'])
omega.login

contest_name = ARGV[0]

contest = omega.contest(contest_name)

contest.observe do |name, user, problem, points, last_score|
  msg = "#{name} >>\n#{user} solved #{problem} with #{points} (+#{points - last_score})"
  bot.api.send_message(chat_id: ENV['CHARROBOT_TELEGRAM_ADMIN'], text: msg)
end
