require 'csv'    

puts
puts "parse CSV file"
Student={}


CSV.foreach("data.csv", :headers => true, :header_converters => :symbol, :converters => :all) do |row|
  Student[row.fields[0]] = Hash[row.headers[1..-1].zip(row.fields[1..-1])]
end

puts Student
puts



#max-min score
String a=Student.max_by{|key, hash| hash[:score] }.first
String b=Student.min_by{|key, hash| hash[:score] }.first


print "The student who got the highest score is ";puts a; 
print a;print "'s score is "; puts Student[a][:score]

print "The student who got the lowest score is ";puts b; 
print b;print "'s score is "; puts Student[b][:score]


#finding mean
total=0.0;
Student.each {|key,hash| total+=hash[:score]}
print "The average score of these students is ";puts total/(Student.length)

puts
#finding student's most popular color
mostfav= Student.values.group_by { |e| e }.values.max_by(&:size)
print "The most popular color is " ;puts mostfav[0][:color]



Color=[]
CSV.foreach(File.path("data.csv")) do |col| 
    # Where col corresponds to a zero-based value/column in the csv  
    Color << [col[2]]
end

Name=[]
CSV.foreach(File.path("data.csv")) do |col| 
    # Where col corresponds to a zero-based value/column in the csv  
    Name << [col[0]]
end


#index 0 for blue, index 1 for red, index 2 for yellow
colorCount=[0,0,0]
#count least fav color
for i in 1...Color.length
   			next if i==0
   			if Color[i][0]=="Blue"
   				colorCount[0]+=1
   			elsif Color[i][0]=="Red"
   				colorCount[1]+=1
   			elsif Color[i][0]=="Yellow"
   				colorCount[2]+=1
   			end
   	 	
end

print "The least favorite color is"

#for i in 0...colorCount.length
	if colorCount[0]==colorCount.min
		print ("Blue ")
	end
	if colorCount[1]==colorCount.min
		print (" Red ")
	end
	if colorCount[2]==colorCount.min
		print (" Yellow")
	end
	
#end

puts "."

puts

puts "Capitalize name"


for i in 1...Name.length
	first_name = ""
	full_split=Name[i][0].split(" ")
	last_name = full_split[0]
	for index in 1...full_split.length
		first_name << full_split[index] + " "

	end
	cap_first_name = first_name[0].downcase + first_name[1..-3] + first_name[-2].upcase
	cap_last_name = last_name[0].downcase + last_name[1..-2] + last_name[-1].upcase
	puts cap_last_name +" " +cap_first_name
end

puts
# h = Hash["a","foo", "b","bar", "c","foo"]
# count=Hash.new(6)
# print count.min_by{|key,hash| hash[:color]}




