module BioLocus

  require 'moneta'

  module Store
    def Store.run(options)
      store = Moneta.new(:LocalMemCache, file: options[:db])
      count = count_new = 0 
      STDIN.each_line do | line |
        if line =~ /^[[:alnum:]]+/
          chr,pos,rest = line.split(/\t/,3)[0..1]
          if pos =~ /^\d+$/
            key = chr+"\t"+pos
            if not store[key]
              count_new += 1 
              store[key] = true
            else
              $stderr.print "Already in store: "
              p [chr,pos]
            end
            count += 1
            $stderr.print '.' if (count % 1_000_000) == 0 if not options[:quiet]
            next
          end
        end
        $stderr.print "Warning: did not store ",line
      end
      store.close
      $stderr.print "Stored #{count_new} positions out of #{count} in #{options[:db]}\n" if !options[:quiet]
    end
  end
end
