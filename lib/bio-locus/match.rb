module BioLocus

  require 'moneta'

  module Match
    def Match.run(options)
      store = Moneta.new(:LocalMemCache, file: options[:db])
      lines = 0 
      count = 0
      STDIN.each_line do | line |
        $stderr.print '.' if (lines % 1_000_000) == 0 if not options[:quiet]
        chr,pos,rest = line.split(/\t/,3)[0..1]
        if chr and pos and pos =~ /^\d+$/
          lines += 1
          if store[chr+"\t"+pos]
            count += 1
            print line
          end
        end
      end
      store.close
      $stderr.print "\nMatched #{count} out of #{lines} lines in #{options[:db]}!\n" if not options[:quiet]
    end
  end
end
