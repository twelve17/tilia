# tilia
Expose the java [concurrent-trees](http://concurrent-trees.googlecode.com/) library to JRuby.

*Note*: This code is at an early stage, and only exposes the `put` and `getKeyValuePairsForKeysStartingWith` methods of the [`ConcurrentRadixTree`](http://concurrent-trees.googlecode.com/svn/concurrent-trees/javadoc/apidocs/com/googlecode/concurrenttrees/radix/ConcurrentRadixTree.html) implementation.  

*This has only been tested under JRuby.*

## Building 

Before you can use the library, you must install the dependent [concurrent-trees](http://concurrent-trees.googlecode.com) jar.  You can [download it on your own from maven](http://mvnrepository.com/artifact/com.googlecode.concurrent-trees/concurrent-trees/2.4.0).  The jar file must be saved to `lib/tilia/concurrent-trees.jar`.

Alternatively, you can run the rake `build_ct_dep` task, which will build it from source and copy it to the proper directory.
```
# rake build_ct_dep 
```
The above task will also create a file `ct.version`, which saves the version of `concurrent-trees` that was built.


Once `concurrent-trees.jar` is installed, you can use the standard rake `build` command to build the gem:

```
# rake build
```

## Usage

See the [concurrent_radix_tree test for example usage](https://github.com/twelve17/tilia/blob/master/test/tilia/test_concurrent_radix_tree.rb#L10).


## TODO

Add rake task to download `concurrent-trees.jar` from maven repo. 
