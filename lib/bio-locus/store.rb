module BioLocus

  module Store
    def Store.run(options)
      store = DbMapper.factory(options)
      count = count_new = count_dup = 0
      STDIN.each_line do | line |
        Keys::each_key(line,options) do | key |
          if not store[key]
            count_new += 1 
            store[key] = true
          else
            count_dup += 1
            if options[:debug]
              $stderr.print "Store hit: <#{key}>\n"
            end
          end
          count += 1
          $stderr.print '.' if (count % 1_000_000) == 0 if not options[:quiet]
          next
        end
      end
      store.close
      $stderr.print "Stored #{count_new} positions out of #{count} in #{options[:db]} (#{count_dup} duplicate hits)\n" if !options[:quiet]
    end
  end
end
