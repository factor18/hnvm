# HNVM: Hermetic Node Version Manager
#### _Hermetically sealed versions of node._

Hermetically sealed `node`, `npm`, `npx`

- Each app or package can define which version of node they depend on
- Upgrades required by one package don't affect another
- Each app or package can run the node version simultaneously

Inspired by https://github.com/Urbancompass/hnvm

### Installation
```
$ bundle install
$ ruby install.rb
```
This will add `npm`, `node`, `npx` to to your global $PATH.
And their versions will be selected in runtime based on the configuration.

### Configuration
HNVM reads its configuration from one of the following places, in order from highest to lowest priority:

- `.hnvmrc` file in the 
- `.hnvmrc` file at the root of git repo, if running in a git repo
- `.hnvmrc` file in your home directory `~/.hnvmrc`

The `.hnvmrc` files are key value pairs:
```
HNVM_NODE=15.13.0
```

### Uninstallation
```
ruby uninstall.rb
```

### License

MIT

