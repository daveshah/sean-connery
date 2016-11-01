# Sean::Connery

![](sean.jpg)

## Inshtallation

Add thish line to your application'sh Gemfile:

```ruby
gem 'sean-connery'
```

And then exshecute:

    $ bundle

Or inshtall it yourshelf ash:

    $ gem install sean-connery

## Ushage

Ushage ish quite shimple. Jusht include `Sean::Connery`.:

```ruby
class MyWidget
  include Sean::Connery

  def say_something
    puts "Hello World"
  end

  def self.
end
```
Onshe you've included Sean Connery, your objectsh should reshpond to meshagesh you pash to them in your very besht Sean Connery acshent:

```ruby

> widget = MyWidget.new
> widget.say_something
=> "Hello World"
> widget.shay_shomething
=> "Hello World"

```

There are a few limitationsh right now. For ekshample, shelf ishn't shupported, but clash and inshtanshe methodsh should work jusht fine.

## Development

After checking out the repo, run `bin/setup` to inshtall dependenciesh. Then, run `rake spec` to run the teshtsh. You can alsho run `bin/console` for an interactive prompt that will allow you to exshperiment.

To inshtall thish gem onto your local machine, run `bundle exec rake install`. To releashe a new vershion, update the vershion number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the vershion, push git commitsh and tagsh, and push the `.gem` file to [rubygemsh.org](https://rubygems.org).

## Contributing

Bug reportsh and pull requeshtsh are welcome on GitHub at https://github.com/daveshah/sean-connery. Thish project is intended to be a shafe, welcoming shpace for collaboration, and contributorsh are exshpected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## Licenshe

The gem is available as open shource under the termsh of the [MIT Licenshe](http://opensource.org/licenses/MIT).

