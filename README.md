# NAME

Dancebin - Simple. Pastebin.

# VERSION

version 0.002

# SYNOPSIS

A simple pastebin using [Dancer](http://search.cpan.org/perldoc?Dancer).

To get started, first update the dsn setting in config.yml to point to a
database that your user has write access to.
Don't worry about creating the database tables.
Dancebin will do that for you the first time it runs.

Then run the app with:

    $ ./bin/app.pl

In a production environment you probably want to run it with something like
[Starman](http://search.cpan.org/perldoc?Starman):

    $ starman -D ./bin/app.pl

# REQUIREMENTS

Dancebin requires [pygments](http://pygments.org/docs/) to be installed
for syntax highlighting.  You can probably install this on your system with:

    $ sudo easy_install Pygments

or something similar.

# AUTHORS

- William Wolf <throughnothing@gmail.com>
- Menno Blom <blom@cpan.org>

# COPYRIGHT AND LICENSE



William Wolf has dedicated the work to the Commons by waiving all of his
or her rights to the work worldwide under copyright law and all related or
neighboring legal rights he or she had in the work, to the extent allowable by
law.

Works under CC0 do not require attribution. When citing the work, you should
not imply endorsement by the author.