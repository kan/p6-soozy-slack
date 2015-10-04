use v6;
unit class Soozy::Slack;

use HTTP::Server::Tiny;

has HTTP::Server::Tiny $.server;

method new(Str $host, int $port) {
    my $s = HTTP::Server::Tiny.new($host, $port);
    self.bless(server => $s);
}

method run() {
    self.server.run(sub ($env) {
        return 200, ['Content-Type' => 'text/plain'], ["hello soozy".encode('ascii')];
    });
}

=begin pod

=head1 NAME

Soozy::Slack - blah blah blah

=head1 SYNOPSIS

  use Soozy::Slack;

=head1 DESCRIPTION

Soozy::Slack is ...

=head1 COPYRIGHT AND LICENSE

Copyright 2015 Kan Fushihara <kan.fushihara@gmail.com>

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
