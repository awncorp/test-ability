package Test::Ability;

use 5.014;

use strict;
use warnings;

use registry;
use routines;

use Data::Object::Class;
use Data::Object::ClassHas;
use Data::Object::Try;

use Clone ();
use Data::Random ();
use Test::More ();

with 'Data::Object::Role::Buildable';
with 'Data::Object::Role::Stashable';

# VERSION

# ATTRIBUTES

has 'arguments' => (
  is => 'ro',
  isa => 'ArrayRef',
  opt => 1,
);

has 'invocant' => (
  is => 'ro',
  isa => 'Object',
  opt => 1,
);

# BUILD

method build_arg($data) {
  {
    invocant => $data
  }
}

method build_self($data) {
  $self->stash(array => $self->can('array'));
  $self->stash(array_object => $self->can('array_object'));
  $self->stash(code => $self->can('code'));
  $self->stash(code_object => $self->can('code_object'));
  $self->stash(date => $self->can('date'));
  $self->stash(datetime => $self->can('datetime'));
  $self->stash(hash => $self->can('hash'));
  $self->stash(hash_object => $self->can('hash_object'));
  $self->stash(instance => $self->can('instance'));
  $self->stash(number => $self->can('number'));
  $self->stash(number_object => $self->can('number_object'));
  $self->stash(object => $self->can('object'));
  $self->stash(regexp => $self->can('regexp'));
  $self->stash(regexp_object => $self->can('regexp_object'));
  $self->stash(scalar => $self->can('scalar'));
  $self->stash(scalar_object => $self->can('scalar_object'));
  $self->stash(string => $self->can('string'));
  $self->stash(string_object => $self->can('string_object'));
  $self->stash(time => $self->can('time'));
  $self->stash(undef => $self->can('undef'));
  $self->stash(undef_object => $self->can('undef_object'));
  $self->stash(word => $self->can('word'));
  $self->stash(words => $self->can('words'));

  return $self;
}

# METHODS

method array(Maybe[Int] $min = 5, Maybe[Int] $max = 10) {
  my $data = [
    Data::Random::rand_chars(
      set => 'all', min => $min, max => $max
    )
  ];

  return $data;
}

method array_object(Maybe[Int] $min = 5, Maybe[Int] $max = 10) {
  my $data = $self->array;
  my $word = $self->word;

  return $self->instance($data, ucfirst($word));
}

method choose(ArrayRef[ArrayRef] $spec = [[]]) {
  my $item = $spec->[rand($#$spec + 1)];
  my $data = $self->dispatch($item);

  return $data;
}

method code(Maybe[Int] @args) {
  my $data = sub {
    ($self->words(@args), $self->number(@args))[rand(2)]
  };

  return $data;
}

method code_object(Maybe[Int] $min, Maybe[Int] $max) {
  my $data = $self->code;
  my $word = $self->word;

  return $self->instance($data, ucfirst($word));
}

method date(Maybe[Str] $min, Maybe[Str] $max) {
  my $data = Data::Random::rand_date(
    min => $min,
    max => $max
  );

  return $data;
}

method datetime(Maybe[Str] $min, Maybe[Str] $max) {
  my $data = Data::Random::rand_datetime(
    min => $min,
    max => $max
  );

  return $data;
}

method dispatch(ArrayRef $item = []) {
  my ($method, $arguments) = @$item;

  if (!$method) {
    return undef;
  }
  else {
    if (my $callback = $self->stash($method)) {
      return $callback->($self, @$arguments);
    }
    else {
      return $self->$method(@$arguments);
    }
  }
}

method hash(Maybe[Int] $min, Maybe[Int] $max) {
  my $data = $self->array($min, $max);

  $data = {
    @$data % 2 ? (@$data, $$data[rand(@$data)]) : @$data
  };

  return $data;
}

method hash_object(Maybe[Int] $min, Maybe[Int] $max) {
  my $data = $self->hash;
  my $word = $self->word;

  return $self->instance($data, ucfirst($word));
}

method instance(Any $value, Str $class) {

  return bless $value, $class;
}

method maybe(ArrayRef[ArrayRef] $spec = [[]]) {
  my $data = ($self->choose($spec), undef)[rand(2)];

  return $data;
}

method number(Maybe[Int] $min = 0, Maybe[Int] $max = 1_000) {
  $min = 0 if !$min || $min > $max;

  my $data = $min + int rand($max - $min);

  return $data;
}

method number_object(Maybe[Int] $min = 0, Maybe[Int] $max = 1_000) {
  my $data = $self->number($min, $max);
  my $word = $self->word;

  return $self->instance(\$data, ucfirst($word));
}

method object() {
  my @objects = qw(
    array_object
    code_object
    hash_object
    number_object
    regexp_object
    scalar_object
    string_object
    undef_object
  );

  my $method = $objects[rand(@objects)];

  return $self->$method;
}

method regexp(Str $exp = '.*') {
  my $word = $self->word;
  my $data = ref($exp) ? $exp : qr/$exp/;

  return $data;
}

method regexp_object(Str $exp = '.*') {
  my $data = $self->regexp($exp);
  my $word = $self->word;

  return $self->instance(\$data, ucfirst($word));
}

method scalar(Maybe[Int] @args) {
  my $data = ($self->words(@args), $self->number(@args))[rand(2)];

  return \$data;
}

method scalar_object(Maybe[Int] $min, Maybe[Int] $max) {
  my $data = $self->scalar;
  my $word = $self->word;

  return $self->instance($data, ucfirst($word));
}

method string(Maybe[Int] $min, Maybe[Int] $max) {
  my $data = $self->words($min, $max);

  return $data;
}

method string_object(Maybe[Int] $min, Maybe[Int] $max) {
  my $data = $self->string;
  my $word = $self->word;

  return $self->instance(\$data, ucfirst($word));
}

method test(Str $name, Int $cycles, ArrayRef[ArrayRef] $spec, CodeRef $callback) {
  my @defaults;

  if ($self->invocant) {
    push @defaults, invocant => $self->invocant;
  }

  if ($self->arguments) {
    push @defaults, arguments => $self->arguments;
  }

  Test::More::subtest($name, sub {
    for my $index (1..$cycles) {
      Test::More::subtest("$name ($index of $cycles)", sub {
        $callback->(Data::Object::Try->new(@defaults),
          map $self->dispatch($_), map Clone::clone($_), @$spec)->result
      });
    }
  });

  return;
}

method time(Maybe[Str] $min, Maybe[Str] $max) {
  my $data = Data::Random::rand_time(
    min => $min,
    max => $max
  );

  return $data;
}

method undef() {

  return undef;
}

method undef_object() {
  my $data = undef;
  my $word = $self->word;

  return $self->instance(\$data, ucfirst($word));
}

method word() {
  my $data = Data::Random::rand_words();

  return $data->[0];
}

method words(Maybe[Int] $min = 2, Maybe[Int] $max = 10) {
  my $data = Data::Random::rand_words(
    min => $min, max => $max
  );

  return join ' ', @$data;
}

1;
