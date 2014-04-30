# coding: utf-8
# CC0
require 'find'

Find.find('地図記号') {|path|
  next unless /svg$/.match path
  [12, 18, 24].each {|width|
    fn = "#{File.basename(path, File.extname(path))}_#{width}"
    ["inkscape --export-width=#{width} --export-png=dst/#{fn}.png #{path}",
     "convert dst/#{fn}.png \\( +clone -background white -shadow 100x2-0-0 \\) -background none -compose DstOver -flatten dst/#{fn}_shadow.png"
    ].each {|cmd|
      system cmd
    }
  }
}

