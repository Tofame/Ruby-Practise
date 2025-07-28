### Reading [docs](https://docs.ruby-lang.org/en/master/index.html) and learning whatever sounds interesting
Currently what grabbed my attention are:
- Symbols
- Ruby Modules - interesting approach to achieving "Interfaces", "Namespaces" and other things
- ERB (cool templates system)
- Ruby resource management [stack overflow](https://stackoverflow.com/questions/214642/raii-in-ruby-or-how-to-manage-resources-in-ruby)

  In other languages I had 'try with resources', here it's either automatic (file) or we use 'ensure' block.
    
    I see people combine ```rescue/ensure with yield``` basically.
- Ruby Inheritance - "<" == "Java's extends".
Instead of interfaces, there are modules. They use keywords:
``include, extend, prepend``.

| Module Keyword | Adds methods to...              | Used for...                                             | Example call location     |
|:---------------|----------------------------------|:---------------------------------------------------------|----------------------------|
| `include`      | Instances                       | Reusable instance methods                                | Inside class               |
| `extend`       | The class itself (as class methods) | Add class-level methods                                   | Inside or outside class    |
| `prepend`      | Instances (but overrides first) | Override instance methods or inject before superclass    | Inside class               |