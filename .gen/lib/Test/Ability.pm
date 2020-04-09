package Test::Ability;

use 5.014;

use strict;
use warnings;

use registry;
use routines;

use Data::Object::Class;
use Data::Object::ClassHas;

extends 'Data::Object::Try';

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

# METHODS

method array() {
  # do something ...

  return $self;
}

method array_object() {
  # do something ...

  return $self;
}

method choose() {
  # do something ...

  return $self;
}

method code() {
  # do something ...

  return $self;
}

method code_object() {
  # do something ...

  return $self;
}

method date() {
  # do something ...

  return $self;
}

method datetime() {
  # do something ...

  return $self;
}

method hash() {
  # do something ...

  return $self;
}

method hash_object() {
  # do something ...

  return $self;
}

method maybe() {
  # do something ...

  return $self;
}

method number() {
  # do something ...

  return $self;
}

method number_object() {
  # do something ...

  return $self;
}

method object() {
  # do something ...

  return $self;
}

method regexp() {
  # do something ...

  return $self;
}

method regexp_object() {
  # do something ...

  return $self;
}

method scalar() {
  # do something ...

  return $self;
}

method scalar_object() {
  # do something ...

  return $self;
}

method string() {
  # do something ...

  return $self;
}

method string_object() {
  # do something ...

  return $self;
}

method test() {
  # do something ...

  return $self;
}

method time() {
  # do something ...

  return $self;
}

method undef() {
  # do something ...

  return $self;
}

method undef_object() {
  # do something ...

  return $self;
}

method word() {
  # do something ...

  return $self;
}

method words() {
  # do something ...

  return $self;
}

1;
