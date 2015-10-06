use v6;

use Crust::Request;
use Crust::App::File;
use HTTP::Tinyish::Curl;

sub app($env) {
    my $req = Crust::Request.new($env);

    if $req.path-info eq '/invite' {
        my $email = $req.parameters<email>;
        say $email;
        signal(SIGCHLD).tap({ say 'hoge'});
        my $token = %*ENV<SLACK-API-TOKEN>;
        my $http = HTTP::Tinyish::Curl.new();
        $http.post:
            "https://soozy.slack.com/api/users.admin.invite",
            headers => { "Content-Type" => "application/x-www-form-urlencoded" },
            content => "email=$email&token=$token&set_active=true",
        ;
        return [200, ['Content-Type' => 'application/json'], ['{"success": 1}'.encode('ascii')]];
    }
    else {
        my $file = Crust::App::File.new(:root("./assets"));
        return $file.call($env);
    }
}

