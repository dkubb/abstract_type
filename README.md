abstract_class
==============

[![Build Status](https://secure.travis-ci.org/dkubb/abstract_class.png?branch=master)](http://travis-ci.org/dkubb/abstract_class)
[![Dependency Status](https://gemnasium.com/dkubb/abstract_class.png)](https://gemnasium.com/dkubb/abstract_class)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/dkubb/abstract_class)

This is a small standalone gem featuring a module ripped out from [veritas](https://github.com/dkubb/veritas).
It allows to declare abstract_class classes and modules in an unobstrusive way.

Installation
------------

There is no gem release yet so use git source.

In your **Gemfile**

``` ruby
gem 'abstract_class', :git => 'https://github.com/dkubb/abstract_class'
```

Examples
--------

``` ruby
class Foo
  include AbstractClass

  # Declare abstract instance method
  abstract :bar

  # Declare abstract singleton method
  abstract_singleton_method :singleton_method
end

Foo.new              # raises NotImplementedError: Foo is an abstract class
Foo.singleton_method # raises NotImplementedError: Foo.bar is not implemented

# Subclassing to allow instancitation
class Baz < Foo; end

object = Baz.new
object.bar # raises NotImplementedError: Baz#bar is not implemented

```

Credits
-------

* Dan Kubb ([dkubb](https://github.com/dkubb))
* Markus Schirp ([dkubb](https://github.com/mbj))

Contributing
-------------

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with Rakefile or version
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

License
-------

Copyright (c) 2001-2012 Dan Kubb

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
