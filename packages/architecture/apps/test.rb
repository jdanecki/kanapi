#!/bin/ruby

$libs = {}
$names = {}

def check_deps(name)
#	puts "check #{name}"
	$libs[name] = [] if $libs[name] == nil

	f = `ldd #{name}`
	f.lines { |line| 
		t = line.split 
		if t.size == 4 then
			if not $libs[name].include?(t[2]) then
			#	puts "deps for #{name} name=#{t[0]} link=#{t[2]}"
				$libs[name] += t[2].split
				$names[t[2]] = t[0]
				check_deps(t[2]) 
			end
		end
	}
#	puts "--- end of #{name} deps ---"
end

if ARGV.size != 1
	puts "add binary name to check"
	exit
end

$names[ARGV[0]] = ARGV[0]
check_deps(ARGV[0])

#puts $libs
#puts $names
puts "digraph G { graph [layout=dot] "

$libs.each { |k,v|
	v.each { |l|
		a = $names[k].tr('/.\-\+','____')
		b = $names[l].tr('.\-\+', '___')
		puts "#{a}[label=\"#{$names[k]}\"]"
	       	puts "#{b}[label=\"#{$names[l]}\"]"
		puts "#{a} -> #{b}"
	}
}

puts "}"
# tred file.gv > new.gv
#
