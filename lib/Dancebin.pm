use strict;
use warnings;
package Dancebin;
use Dancer;
use Dancer::Plugin::DBIC qw( schema );
use DateTime;
use Dancebin::Pygments qw( highlight );
use Data::UUID;

# ABSTRACT: Simple. Pastebin.

# Create the db if this is the first time app is ever run.
eval { schema->deploy };

get '/' => sub { template 'index.tt' };

sub _get_exp {
    my ( $exp ) = @_;
    $exp = $exp ? { split ':', $exp } : undef;

    if( $exp && $exp->{never} ){
        return undef; # Never Expire
    }

    return schema->storage->datetime_parser->format_datetime(
        DateTime->now->add( %{ $exp || config->{expiration} } ));
}

post '/' => sub {
    my $p = params;
    return send_error("No Code!", 400) unless $p->{code};

    ( my $id = Data::UUID->new->create_b64 ) =~ s/\W//g;

    return redirect '/' . schema->resultset('Post')->create({
        id    => $id,
        title => $p->{title},
        code  => $p->{code},
        html  => highlight(
            code  => $p->{code},
            lang  => $p->{lang},
            title => $p->{title}
        ),
        language => $p->{lang},
        expiration => _get_exp( $p->{expiration} ),
    })->id;
};

any '/**' => sub {
    my ( $tokens ) = splat;
    my $id = $tokens->[0];
    return redirect '/' unless $id;

    my $post = schema->resultset('Post')->search({
        id => $id,
        expiration => [ undef,  { '>' => DateTime->now } ],
    })->single;
    return redirect '/' unless $post;

    var post => $post;
    pass;
};

get '/:id' => sub { template 'show.tt', { post => vars->{post} } };

get '/:id/raw' => sub {
    content_type 'text/plain';
    return vars->{post}->code;
};

1;

=head1 SYNOPSIS

A simple pastebin using L<Dancer>.

To get started, first update the dsn setting in config.yml to point to a
database that your user has write access to.
Don't worry about creating the database tables.
Dancebin will do that for you the first time it runs.

Then run the app with:

    $ ./bin/app.pl

In a production environment you probably want to run it with something like
L<Starman>:

    $ starman -D ./bin/app.pl

=head1 REQUIREMENTS

Dancebin requires L<pygments|http://pygments.org/docs/> to be installed
for syntax highlighting.  You can probably install this on your system with:

    $ sudo easy_install Pygments

or something similar.
