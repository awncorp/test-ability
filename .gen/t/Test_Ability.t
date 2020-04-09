use 5.014;

use strict;
use warnings;
use routines;

use Test::Auto;
use Test::More;

=name

Test::Ability

=cut

=abstract

Property-Based Testing

=cut

=includes

method: array
method: array_object
method: choose
method: code
method: code_object
method: date
method: datetime
method: hash
method: hash_object
method: maybe
method: number
method: number_object
method: object
method: regexp
method: regexp_object
method: scalar
method: scalar_object
method: string
method: string_object
method: test
method: time
method: undef
method: undef_object
method: word
method: words

=cut

=synopsis

  use Test::Ability;

  # do something ...

=cut

=libraries

Types::Standard

=cut

=inherits

Data::Object::Try

=cut

=integrates

Data::Object::Role::Buildable
Data::Object::Role::Stashable

=cut

=attributes

arguments: ro, opt, ArrayRef
invocant: ro, opt, Object

=cut

=description

This package provides methods for generating values and test-cases.

=cut

=method array

The array method returns a random array reference.

=signature array

array(Any %args) : Any

=example-1 array

  # given: synopsis

  # do something ...

=cut

=method array_object

The array_object method returns a random array object.

=signature array_object

array_object(Any %args) : Any

=example-1 array_object

  # given: synopsis

  # do something ...

=cut

=method choose

The choose method returns a random value from the set of specified generators.

=signature choose

choose(ArrayRef[ArrayRef] $args) : Any

=example-1 choose

  # given: synopsis

  # do something ...

=cut

=method code

The code method returns a random code reference.

=signature code

code(Any %args) : Any

=example-1 code

  # given: synopsis

  # do something ...

=cut

=method code_object

The code_object method returns a random code object.

=signature code_object

code_object(Any %args) : Any

=example-1 code_object

  # given: synopsis

  # do something ...

=cut

=method date

The date method returns a random date.

=signature date

date(Any %args) : Any

=example-1 date

  # given: synopsis

  # do something ...

=cut

=method datetime

The datetime method returns a random date and time.

=signature datetime

datetime(Any %args) : Any

=example-1 datetime

  # given: synopsis

  # do something ...

=cut

=method hash

The hash method returns a random hash reference.

=signature hash

hash(Any %args) : Any

=example-1 hash

  # given: synopsis

  # do something ...

=cut

=method hash_object

The hash_object method returns a random hash object.

=signature hash_object

hash_object(Any %args) : Any

=example-1 hash_object

  # given: synopsis

  # do something ...

=cut

=method maybe

The maybe method returns a random choice using the choose method, or the undefined value.

=signature maybe

maybe(ArrayRef[ArrayRef] $args) : Any

=example-1 maybe

  # given: synopsis

  # do something ...

=cut

=method number

The number method returns a random number.

=signature number

number(Any %args) : Any

=example-1 number

  # given: synopsis

  # do something ...

=cut

=method number_object

The number_object method returns a random number object.

=signature number_object

number_object(Any %args) : Any

=example-1 number_object

  # given: synopsis

  # do something ...

=cut

=method object

The object method returns a random object.

=signature object

object(Any %args) : Any

=example-1 object

  # given: synopsis

  # do something ...

=cut

=method regexp

The regexp method returns a random regexp.

=signature regexp

regexp(Any %args) : Any

=example-1 regexp

  # given: synopsis

  # do something ...

=cut

=method regexp_object

The regexp_object method returns a random regexp object.

=signature regexp_object

regexp_object(Any %args) : Any

=example-1 regexp_object

  # given: synopsis

  # do something ...

=cut

=method scalar

The scalar method returns a random scalar reference.

=signature scalar

scalar(Any %args) : Any

=example-1 scalar

  # given: synopsis

  # do something ...

=cut

=method scalar_object

The scalar_object method returns a random scalar object.

=signature scalar_object

scalar_object(Any %args) : Any

=example-1 scalar_object

  # given: synopsis

  # do something ...

=cut

=method string

The string method returns a random string.

=signature string

string(Any %args) : Any

=example-1 string

  # given: synopsis

  # do something ...

=cut

=method string_object

The string_object method returns a random string object.

=signature string_object

string_object(Any %args) : Any

=example-1 string_object

  # given: synopsis

  # do something ...

=cut

=method test

The test method generates subtests using L<Test::More/subtest>, also (optionally) generating values which it ....

=signature test

test(Str $name, Int $cycles, ArrayRef[ArrayRef] $spec, CodeRef $callback) : Any

=example-1 test

  # given: synopsis

  # do something ...

=cut

=method time

The time method returns a random time.

=signature time

time(Any %args) : Any

=example-1 time

  # given: synopsis

  # do something ...

=cut

=method undef

The undef method returns the undefined value.

=signature undef

undef(Any %args) : Any

=example-1 undef

  # given: synopsis

  # do something ...

=cut

=method undef_object

The undef_object method returns the undefined value as an object.

=signature undef_object

undef_object(Any %args) : Any

=example-1 undef_object

  # given: synopsis

  # do something ...

=cut

=method word

The word method returns a random word.

=signature word

word(Any %args) : Any

=example-1 word

  # given: synopsis

  # do something ...

=cut

=method words

The words method returns random words.

=signature words

words(Any %args) : Any

=example-1 words

  # given: synopsis

  # do something ...

=cut

package main;

my $test = testauto(__FILE__);

my $subs = $test->standard;

$subs->synopsis(fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'array', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'array_object', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'choose', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'code', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'code_object', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'date', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'datetime', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'hash', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'hash_object', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'maybe', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'number', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'number_object', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'object', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'regexp', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'regexp_object', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'scalar', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'scalar_object', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'string', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'string_object', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'test', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'time', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'undef', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'undef_object', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'word', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

$subs->example(-1, 'words', 'method', fun($tryable) {
  ok my $result = $tryable->result;

  $result
});

ok 1 and done_testing;
