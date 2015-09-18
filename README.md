# Rotcev -- linear-list like array
## example
    $ irb22
    irb> load "rotcev_rb.rb"
    => true
    irb> foo = Rotcev.new
    => []
    irb> foo = foo.put 1
    => [1]
    irb> bar = foo.put 2
    => [2, 1]
    irb> baz = bar.put 3
    => [3, 2, 1]
    irb> foo
    => [1]
    irb> bar
    => [2, 1]
    irb> baz
    => [3, 2, 1]
![fig1](https://raw.githubusercontent.com/metanest/rotcev/master/imgs/fig1.png "(shared)")

    irb> quux = bar.put 4
    => [4, 2, 1]
    irb> bar
    => [2, 1]
    irb> baz
    => [3, 2, 1]
![fig2](https://raw.githubusercontent.com/metanest/rotcev/master/imgs/fig2.png "(unshared)")
