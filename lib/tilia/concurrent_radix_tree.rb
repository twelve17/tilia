module Tilia
  class ConcurrentRadixTree

    if RUBY_PLATFORM =~ /java/

      def put(prefix, weight)
        self.tree.put(prefix, weight)
      end

      def get_key_value_pairs_for_keys_starting_with(prefix)
        self.tree.get_key_value_pairs_for_keys_starting_with(prefix.to_java).map { |x| [x.key, x.value] }
      end

      protected

      def tree
        @tree ||= com.googlecode.concurrenttrees.radix.ConcurrentRadixTree.new(
          com.googlecode.concurrenttrees.radix.node.concrete.DefaultCharArrayNodeFactory.new
        )
      end
    end

  end
end
