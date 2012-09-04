
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Simple. Pastebin.",
  "AUTHOR" => "William Wolf <throughnothing\@gmail.com>",
  "BUILD_REQUIRES" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "Test::More" => 0
  },
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
    "DBIx::Class::Schema" => 0,
    "Dancer" => 0,
    "Dancer::Plugin::DBIC" => 0,
    "Data::UUID" => 0,
    "DateTime" => 0,
    "DateTime::Format::SQLite" => 0,
    "Encode" => 0,
    "Exporter" => 0,
    "IPC::Run" => 0,
    "SQl::Translator" => "0.11012",
    "base" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.002",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



