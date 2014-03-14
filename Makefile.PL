
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Simple. Pastebin.",
  "AUTHOR" => "William Wolf <throughnothing\@gmail.com>, Menno Blom <blom\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dancebin",
  "EXE_FILES" => [
    "bin/app.pl"
  ],
  "LICENSE" => "unrestricted",
  "NAME" => "Dancebin",
  "PREREQ_PM" => {
    "DBIx::Class::Core" => 0,
    "DBIx::Class::InflateColumn::DateTime" => 0,
    "DBIx::Class::Schema" => 0,
    "Dancer" => 0,
    "Dancer::Plugin::DBIC" => 0,
    "Data::UUID" => 0,
    "DateTime" => 0,
    "DateTime::Format::SQLite" => 0,
    "Encode" => 0,
    "Exporter" => 0,
    "IPC::Run" => 0,
    "SQL::Translator" => "0.11012",
    "Starman" => 0,
    "Template" => 0,
    "base" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Test::More" => 0
  },
  "VERSION" => "0.002",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "DBIx::Class::Core" => 0,
  "DBIx::Class::InflateColumn::DateTime" => 0,
  "DBIx::Class::Schema" => 0,
  "Dancer" => 0,
  "Dancer::Plugin::DBIC" => 0,
  "Data::UUID" => 0,
  "DateTime" => 0,
  "DateTime::Format::SQLite" => 0,
  "Encode" => 0,
  "Exporter" => 0,
  "File::Spec" => 0,
  "IO::Handle" => 0,
  "IPC::Open3" => 0,
  "IPC::Run" => 0,
  "SQL::Translator" => "0.11012",
  "Starman" => 0,
  "Template" => 0,
  "Test::More" => 0,
  "base" => 0,
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



