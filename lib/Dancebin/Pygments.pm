package Dancebin::Pygments;
use Dancer ':syntax';
use Encode qw( decode_utf8 );
use Exporter;
use IPC::Run qw( run );

our @ISA = qw( Exporter );
our @EXPORT_OK = qw( highlight );

# ABSTRACT: Wrapper for Python Pygments

my $pygment = $ENV{DANCEBIN_PYGMENT} || 'pygmentize';

sub highlight {
    my ( %args ) = @_;
    return unless $args{code};

    my @cmd = (
        $pygment, qw(
            -f html
            -O linenos=1
            -O anchorlinenos
            -O lineanchors=L
            -O encoding=utf-8
        )
    );
    push @cmd, ( '-l', $args{lang} ) if $args{lang};
    # Only try to guess file type by contents in lang is passed in
    push @cmd, '-g' unless $args{lang};

    my ($in, $out) = ( $args{code} );
    run \@cmd, \$in, \$out or return;
    return decode_utf8( $out );
}

1;
