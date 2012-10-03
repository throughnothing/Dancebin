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

  data_type: 'text'
  is_nullable: 0

=head2 ts

  data_type: 'timestamp'
  default_value: current_timestamp
  is_nullable: 1

=head2 expiration

  data_type: 'timestamp'
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
  { data_type => "text", is_nullable => 0 },
  "ts",
  {
    data_type     => "timestamp",
    default_value => \"current_timestamp",
    is_nullable   => 1,
  },
  "expiration",
  { data_type => "timestamp", is_nullable => 1 },
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


# Created by DBIx::Class::Schema::Loader v0.07010 @ 2012-05-08 14:22:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XwVbT5yQ7yN7YwWcy9e0xA

# ABSTRACT: DBIx::Class Representation of posts table

# You can replace this text with custom code or comments, and it will be preserved on regeneration
use Dancer ':script';
__PACKAGE__->load_components(qw/InflateColumn::DateTime/);
__PACKAGE__->add_columns(
    '+ts' => {
        timezone => config->{time_zone},
        locale => config->{locale}
    },
    '+expiration' => {
        timezone => config->{time_zone},
        locale => config->{locale},
        formatter => 'DateTime::Format::MySQL'
    }
);

1;
