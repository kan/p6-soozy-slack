use v6;

use Soozy::Slack;

my $soozy = Soozy::Slack.new('127.0.0.1', 8080);

$soozy.run()
