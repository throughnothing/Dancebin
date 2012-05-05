# NAME

Dancebin - Simple. Pastebin.

# VERSION

version 0.001

# SYNOPSIS

A simple pastebin using [Dancer](http://search.cpan.org/perldoc?Dancer).

To get started, create the sqlite database by running:

    $ sqlite3 data/dancebin.db < data/schema.sql

Then run the app with:

    $ ./bin/app.pl

# REQUIREMENTS

Dancebin requires [pygments](http://pygments.org/docs/) to be installed
for syntax highlighting.  You can probably install this on your system with:

    $ sudo easy_install Pygments

or something similar.

# AUTHOR

William Wolf <throughnothing@gmail.com>

# COPYRIGHT AND LICENSE



William Wolf has dedicated the work to the Commons by waiving all of his
or her rights to the work worldwide under copyright law and all related or
neighboring legal rights he or she had in the work, to the extent allowable by
law.

Works under CC0 do not require attribution. When citing the work, you should
not imply endorsement by the author.