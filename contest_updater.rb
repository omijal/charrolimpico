require 'omega'
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
puts "Observing #{ENV['CHARROBOT_TELEGRAM_ADMIN']}"

contest = omega.contest(contest_name)

score_notif = Proc.new do |name, user, problem, points, last_score|
  msg = "#{name} >>\n#{user} solved #{problem} with #{points} (+#{points - last_score})"
  bot.api.send_message(chat_id: ENV['CHARROBOT_TELEGRAM_ADMIN'], text: msg)
end

clar_notif = Proc.new do |question|
  bot.api.send_message(chat_id: ENV['CHARROBOT_TELEGRAM_ADMIN'], text: "Open Clarification >> \n #{question}")
end

contest.observe(score_notif, clar_notif)
