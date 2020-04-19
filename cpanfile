requires "Clone" => "0.43";
requires "Data::Object::Class" => "2.02";
requires "Data::Object::ClassHas" => "2.01";
requires "Data::Object::Role::Buildable" => "0.03";
requires "Data::Object::Role::Stashable" => "2.01";
requires "Data::Object::Try" => "2.02";
requires "Data::Random" => "0.13";
requires "perl" => "5.014";
requires "routines" => "0";
requires "strict" => "0";
requires "warnings" => "0";

on 'test' => sub {
  requires "Clone" => "0.43";
  requires "Data::Object::Class" => "2.02";
  requires "Data::Object::ClassHas" => "2.01";
  requires "Data::Object::Role::Buildable" => "0.03";
  requires "Data::Object::Role::Stashable" => "2.01";
  requires "Data::Object::Try" => "2.02";
  requires "Data::Random" => "0.13";
  requires "Test::Auto" => "0.10";
  requires "perl" => "5.014";
  requires "routines" => "0";
  requires "strict" => "0";
  requires "warnings" => "0";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
};
