# abstract_type

This is a small standalone gem featuring a module ripped out from [axiom](https://github.com/dkubb/axiom).
It allows to declare abstract_type classes and modules in an unobstrusive way.

[![Gem Version](https://badge.fury.io/rb/abstract_type.png)][gem]
[![Build Status](https://secure.travis-ci.org/dkubb/abstract_type.png?branch=master)][travis]
[![Dependency Status](https://gemnasium.com/dkubb/abstract_type.png)][gemnasium]
[![Code Climate](https://codeclimate.com/github/dkubb/abstract_type.png)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/dkubb/abstract_type/badge.png?branch=master)][coveralls]

[gem]: https://rubygems.org/gems/abstract_type
[travis]: https://travis-ci.org/dkubb/abstract_type
[gemnasium]: https://gemnasium.com/dkubb/abstract_type
[codeclimate]: https://codeclimate.com/github/dkubb/abstract_type
[coveralls]: https://coveralls.io/r/dkubb/abstract_type

## Examples

``` ruby
class Foo
  include AbstractType

  # Declare abstract instance method
  abstract_method :bar

  # Declare abstract singleton method
  abstract_singleton_method :baz
end

Foo.new  # raises NotImplementedError: Foo is an abstract type
Foo.baz  # raises NotImplementedError: Foo.baz is not implemented

# Subclassing to allow instantiation
class Baz < Foo; end

object = Baz.new
object.bar  # raises NotImplementedError: Baz#bar is not implemented

```

## Credits

* Dan Kubb ([dkubb](https://github.com/dkubb))
* Markus Schirp ([mbj](https://github.com/mbj))

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## Copyright

Copyright &copy; 2009-2013 Dan Kubb. See LICENSE for details.
