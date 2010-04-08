require "csv"
class CsvYml  
    
   def initialize()  
     puts "Creating Fixtures"
   end  
     
   def convert(input_file)  
     doc = CSV.read(input_file) 
     doc_fix = File.open(input_file + ".yml", 'w')
     n = Array.new     
     flag = 0
     doc.find_all do |m|
	if flag != 0
          doc_fix << "id_" + m[0] + ":\n"
	  n.length.times do |i|
             doc_fix << "  "+ n[i] +": " + m[i].to_s + "\n"
	  end
	  doc_fix << "\n"
	else
	  m.length.times do |i|
	    n[i] = m[i]
	  end
	end
        flag = 1
      end
   end  
 
 end  

if $0 == __FILE__ # command line
  unless ARGV.length == 1 then puts "Usage: ruby csv_yml.rb csvfile.csv"; exit; end
  require 'pp'
  ARGV.each { |f| c1 = CsvYml.new(); c1.convert(f) }
end
