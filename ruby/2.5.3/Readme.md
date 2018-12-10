# Container for developing Ruby docker services

## Use this command to start the container:

```
docker run --rm -it --name ruby-dev 181gaming/ruby
```

## Versions:

* latest, [latest/Dockerfile](https://github.com/nicholashoule/docker/tree/master/ruby/)
* 2.5.3, [2.5.3/Dockerfile](https://github.com/nicholashoule/docker/tree/master/ruby/2.5.3/)

## Information:

[Ruby Downloads](https://www.ruby-lang.org/en/downloads/)
[RVM, Download](https://rvm.io/)

## Commands:

```

rvm install 2.5.3
rvm --default use 2.5.3
gem install [something]
bundle env
bundle install

```

```

ruby -ropen-uri -e 'eval open("https://git.io/vQhWq").read'

```


### Links:

[From Wikipedia, ruby](https://en.wikipedia.org/wiki/Ruby_%28programming_language%29)

Ruby is a dynamic, interpreted, reflective, object-oriented, general-purpose programming language. It was
designed and developed in the mid-1990s by Yukihiro "Matz" Matsumoto in Japan. According to the creator, Ruby
was influenced by Perl, Smalltalk, Eiffel, Ada, and Lisp. It supports multiple programming paradigms, including
functional, object-oriented, and imperative. It also has a dynamic type system and automatic memory management.
