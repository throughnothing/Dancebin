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

post '/' => sub {
    my $p = params;
    return send_error("No Code!", 400) unless $p->{code};

    ( my $id = Data::UUID->new->create_b64 ) =~ s/\W//g;

    my $html = highlight(
        code  => $p->{code},
        lang  => $p->{lang},
        title => $p->{title}
    );
    $html = _add_anchor_links($html);

    return redirect '/' . schema->resultset('Post')->create({
        id    => $id,
        title => $p->{title},
        code  => $p->{code},
        html  => $html,
        language => $p->{lang},
    })->id;
};

any '/**' => sub {
    my ( $tokens ) = splat;
    my $id = $tokens->[0];
    return redirect '/' unless $id;

    my $post = schema->resultset('Post')->search({
        id => $id,
        ts => { '>=' => DateTime->now->subtract( weeks => 1 ) },
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

sub _add_anchor_links {
    my ($html) = @_;
    my @html_with_anchors;
    for (split /\n/, $html) {
        if (m{<div class="linenodiv"><pre>\s*1$} .. m{</pre>}) {
            if (m{</pre>}) { # the last line is a special case
                s{^(\d+)</pre>.*}
                 {<a name="l$1"></a><a href="#l$1">$1</a></pre>};
            } else {
                s{(\d+)$}{<a name="l$1"></a><a href="#l$1">$1</a>};
            }
            push @html_with_anchors, $_;
        }
    }
    my $html_with_anchors = join "\n", @html_with_anchors;
    $html =~ s{^.+<div class="linenodiv"><pre>.+?</pre>}{$html_with_anchors}s;
    return $html;
}

1;

=head1 SYNOPSIS

A simple pastebin using L<Dancer>.

To get started, create the sqlite database by running:

    $ sqlite3 data/dancebin.db < data/schema.sql

Then run the app with:

    $ ./bin/app.pl

=head1 REQUIREMENTS

Dancebin requires L<pygments|http://pygments.org/docs/> to be installed
for syntax highlighting.  You can probably install this on your system with:

    $ sudo easy_install Pygments

or something similar.
