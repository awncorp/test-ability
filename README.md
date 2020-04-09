# NAME

Test::Ability

# ABSTRACT

Property-Based Testing

# SYNOPSIS

    package main;

    use Test::Ability;

    my $t = Test::Ability->new;

# DESCRIPTION

This package provides methods for generating random values and test-cases.

# INTEGRATES

This package integrates behaviors from:

[Data::Object::Role::Buildable](https://metacpan.org/pod/Data%3A%3AObject%3A%3ARole%3A%3ABuildable)

[Data::Object::Role::Stashable](https://metacpan.org/pod/Data%3A%3AObject%3A%3ARole%3A%3AStashable)

# LIBRARIES

This package uses type constraints from:

[Types::Standard](https://metacpan.org/pod/Types%3A%3AStandard)

# ATTRIBUTES

This package has the following attributes:

## arguments

    arguments(ArrayRef)

This attribute is read-only, accepts `(ArrayRef)` values, and is optional.

## invocant

    invocant(Object)

This attribute is read-only, accepts `(Object)` values, and is optional.

# METHODS

This package implements the following methods:

## array

    array(Int $min, Int $max) : ArrayRef

The array method returns a random array reference.

- array example #1

        # given: synopsis

        $t->array;

## array\_object

    array_object(Int $min, Int $max) : Object

The array\_object method returns a random array object.

- array\_object example #1

        # given: synopsis

        $t->array_object;

## choose

    choose(ArrayRef[ArrayRef] $args) : Any

The choose method returns a random value from the set of specified generators.

- choose example #1

        # given: synopsis

        $t->choose([['datetime'], ['words', [2,3]]]);

## code

    code(Int $min, Int $max) : CodeRef

The code method returns a random code reference.

- code example #1

        # given: synopsis

        $t->code;

## code\_object

    code_object(Int $min, Int $max) : Object

The code\_object method returns a random code object.

- code\_object example #1

        # given: synopsis

        $t->code_object;

## date

    date(Int $min, Int $max) : Str

The date method returns a random date.

- date example #1

        # given: synopsis

        $t->date;

## datetime

    datetime(Int $min, Int $max) : Str

The datetime method returns a random date and time.

- datetime example #1

        # given: synopsis

        $t->datetime;

## hash

    hash(Int $min, Int $max) : HashRef

The hash method returns a random hash reference.

- hash example #1

        # given: synopsis

        $t->hash;

## hash\_object

    hash_object(Any %args) : Object

The hash\_object method returns a random hash object.

- hash\_object example #1

        # given: synopsis

        $t->hash_object;

## maybe

    maybe(ArrayRef[ArrayRef] $args) : Any

The maybe method returns a random choice using the choose method, or the
undefined value.

- maybe example #1

        # given: synopsis

        $t->maybe([['date'], ['time']]);

## number

    number(Int $min, Int $max) : Int

The number method returns a random number.

- number example #1

        # given: synopsis

        $t->number;

## number\_object

    number_object(Int $min, Int $max) : Object

The number\_object method returns a random number object.

- number\_object example #1

        # given: synopsis

        $t->number_object;

## object

    object() : Object

The object method returns a random object.

- object example #1

        # given: synopsis

        $t->object;

## regexp

    regexp(Str $exp) : RegexpRef

The regexp method returns a random regexp.

- regexp example #1

        # given: synopsis

        $t->regexp;

## regexp\_object

    regexp_object(Str $exp) : Object

The regexp\_object method returns a random regexp object.

- regexp\_object example #1

        # given: synopsis

        $t->regexp_object;

## scalar

    scalar(Int $min, Int $max) : Ref

The scalar method returns a random scalar reference.

- scalar example #1

        # given: synopsis

        $t->scalar;

## scalar\_object

    scalar_object(Int $min, Int $max) : Object

The scalar\_object method returns a random scalar object.

- scalar\_object example #1

        # given: synopsis

        $t->scalar_object;

## string

    string(Int $min, Int $max) : Str

The string method returns a random string.

- string example #1

        # given: synopsis

        $t->string;

## string\_object

    string_object(Int $min, Int $max) : Object

The string\_object method returns a random string object.

- string\_object example #1

        # given: synopsis

        $t->string_object;

## test

    test(Str $name, Int $cycles, ArrayRef[ArrayRef] $spec, CodeRef $callback) : Undef

The test method generates subtests using ["subtest" in Test::More](https://metacpan.org/pod/Test%3A%3AMore#subtest), optionally
generating and passing random values to each iteration as well as a
[Data::Object::Try](https://metacpan.org/pod/Data%3A%3AObject%3A%3ATry) object for easy execution of callbacks and interception of
exceptions. This callback expected should have the signature `($tryable,
@arguments)` where `@arguments` contains the generated values in the order
specified. The callback must return the `$tryable` object, which is called for
you automatically, executing the subtest logic you've implemented.

- test example #1

        # given: synopsis

        # use Test::More;

        sub is_an_adult {
          my ($age) = @_;

          $age >= 18;
        }

        $t->test('is_an_adult', 100, [['number', [10, 30]]], sub {
          my ($tryable, $age) = @_;

          $tryable->call(sub {
            if ($age >= 18) {
              ok is_an_adult($age),
                "age is $age, is an adult";
            }
            else {
              ok !is_an_adult($age),
                "age is $age, is not an adult";
            }
          });

          $tryable
        });

## time

    time(Int $min, Int $max) : Str

The time method returns a random time.

- time example #1

        # given: synopsis

        $t->time;

## undef

    undef() : Undef

The undef method returns the undefined value.

- undef example #1

        # given: synopsis

        $t->undef;

## undef\_object

    undef_object() : Object

The undef\_object method returns the undefined value as an object.

- undef\_object example #1

        # given: synopsis

        $t->undef_object;

## word

    word() : Str

The word method returns a random word.

- word example #1

        # given: synopsis

        $t->word;

## words

    words(Int $min, Int $max) : Str

The words method returns random words.

- words example #1

        # given: synopsis

        $t->words;

# AUTHOR

Al Newkirk, `awncorp@cpan.org`

# LICENSE

Copyright (C) 2011-2019, Al Newkirk, et al.

This is free software; you can redistribute it and/or modify it under the terms
of the The Apache License, Version 2.0, as elucidated in the ["license
file"](https://github.com/iamalnewkirk/foobar/blob/master/LICENSE).

# PROJECT

[Wiki](https://github.com/iamalnewkirk/foobar/wiki)

[Project](https://github.com/iamalnewkirk/foobar)

[Initiatives](https://github.com/iamalnewkirk/foobar/projects)

[Milestones](https://github.com/iamalnewkirk/foobar/milestones)

[Contributing](https://github.com/iamalnewkirk/foobar/blob/master/CONTRIBUTE.md)

[Issues](https://github.com/iamalnewkirk/foobar/issues)
