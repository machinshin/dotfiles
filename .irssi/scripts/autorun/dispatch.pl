use strict;
use warnings;
use Irssi;
use Irssi::Irc;
use vars qw($VERSION %IRSSI);

$VERSION = "0.0.2";
%IRSSI = (
	authors     => "Sebastian 'yath' Schmidt",
	contact     => "yathen\@web.de",
	name        => "Command dispatcher",
	description => "This scripts sends unknown commands to the server",
	license     => "GNU GPLv2",
	changed     => "Tue Mar  5 14:55:29 CET 2002",
);

sub event_default_command {
	my ($command, $server) = @_;
    if ($command =~ /^\d+$/) {
        $server->command("window $command");
        Irssi::signal_stop();
        return;
    }
 
    return if (Irssi::settings_get_bool("dispatch_unknown_commands") == 0
        || !$server
        || $command =~ y/\/// != 0);
    return if (ref $server eq 'Irssi::Xmpp::Server');
    $server->send_raw($command);
    Irssi::signal_stop();
}

Irssi::settings_add_bool("misc", "dispatch_unknown_commands", 1);
Irssi::signal_add_first("default command", "event_default_command");
