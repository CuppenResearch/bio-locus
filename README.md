# bio-locus

[![Build Status](https://secure.travis-ci.org/pjotrp/bioruby-locus.png)](http://travis-ci.org/pjotrp/bioruby-locus)

Bio-locus is a tool for fast querying of genome locations. Many file
formats in bioinformatics contain records that start with a chromosome
name and a position for a SNP, or a start-end position for indels.

This tool essentially allows your to store this information in a Hash
or database:

```sh
  bio-locus --store < one.vcf 
```

which creates or adds to a cache file or database. To find positions
in another dataset which match those in the database:

```sh
  bio-locus --match < two.vcf
```

Main point is that this is a two-step process, first create the
indexed database, next query it.

Why would you use bio-locus?

* To reduce the size of large SNP databases before storage/querying
* To gain performance

In short a more targetted approach allowing you to work with less
data.

Note: for the storage the [moneta](https://github.com/minad/moneta) gem is used, currently with localmemcache.

Note: this software is under active development!

## Installation

```sh
gem install bio-locus
```

## Usage

```ruby
require 'bio-locus'
```

The API doc is online. For more code examples see the test files in
the source tree.
        
## Project home page

Information on the source tree, documentation, examples, issues and
how to contribute, see

  http://github.com/pjotrp/bioruby-locus

The BioRuby community is on IRC server: irc.freenode.org, channel: #bioruby.

## Cite

If you use this software, please cite one of
  
* [BioRuby: bioinformatics software for the Ruby programming language](http://dx.doi.org/10.1093/bioinformatics/btq475)
* [Biogem: an effective tool-based approach for scaling up open source software development in bioinformatics](http://dx.doi.org/10.1093/bioinformatics/bts080)

## Biogems.info

This Biogem is published at (http://biogems.info/index.html#bio-locus)

## Copyright

Copyright (c) 2014 Pjotr Prins. See LICENSE.txt for further details.

