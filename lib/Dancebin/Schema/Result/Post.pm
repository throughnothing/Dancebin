package Dancebin::Schema::Result::Post;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Dancebin::Schema::Result::Post

=cut

__PACKAGE__->table("posts");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 ts

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 1

=head2 language

  data_type: 'text'
  is_nullable: 1

=head2 title

  data_type: 'text'
  is_nullable: 1

=head2 code

  data_type: 'blob'
  is_nullable: 0

=head2 html

  data_type: 'blob'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "ts",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 1,
  },
  "language",
  { data_type => "text", is_nullable => 1 },
  "title",
  { data_type => "text", is_nullable => 1 },
  "code",
  { data_type => "blob", is_nullable => 0 },
  "html",
  { data_type => "blob", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2012-05-04 22:58:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:f5XIMsVNNwhDKkbTZuRXlw

# ABSTRACT: DBIx::Class Representation of posts table

# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
