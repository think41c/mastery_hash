# Hash basics. A randomly accessible array using Keys and Values, where the Keys are indexed by any object 
# instead of a fixed count of [0..end].

p hash_methods = Hash.methods.count      # 97 built in methods in a Hash. The class has things like .new. 
p hash_imeths  = Hash.instance_methods   # 147
zz = {}                            
p zz.methods               # 147 *instance* methods 
anum = hash_methods.count
p hash_imeths.uniq.count

p hash_methods - hash_imeths

# Assigning the Hash

a = { :symbolz  => 10 }  # Standard syntax - :symbol => 'value' 
b = { "stringz" => 15 }  # Anything can be a key. 
c = {  symbolz:    20 }  # Only used when ALL keys are ALL symbols   
puts a[:symbolz]    # 10
puts b["stringz"]   # 15
puts c[:symbolz]    # 20 

# Bad ideas:

# puts h = { symbolz: 20, "Stringz" => 15}   # You can't change the assignment method of x: y, if all keys aren't symbols.
# puts options[symbolz:]   # unexpected ']'  . Just b/c you assign a Hash w/ : on right, doesn't mean you call it the same way
# puts d[:symbolz => 3]    # undefined method 'd'  
 a[:symbolz => 3]      # Nil. Doesn't actually change or alter it. Once assigned, you can't 'reassign' using this style.  
 a[:symbolz] = 3       # This is what you would want to do to change it. 

# Interesting options
z = { "Ben" => "Jery" }    # Strings as both keys and values.
y = { [1,2] => "Wat?" }    # Array as a key
x = { Hash.new(0) => 666 } # A Hash as a key

puts z["Ben"]     # Jery
puts y[[1,2]]     # Wat?
puts x[{}]        # 666
puts z["Ether"]   # Nil

# Creating the Hash - Only 5 ways.

r = {}             # Creates a Hash indentically to the "Hash.new" way. All uncreated keys are 'nil'
s = Hash.new       # No point in typing this. Just use {}. All uncreated keys are 'nil'
t = Hash.new(0)    # Takes in the parameter '0'. All uncreated key's values are '0'
u = { :just => "make", :the => "hash"}  # Creates a new Hash and assigns keys/values. All uncreated keys are 'nil'
v = Hash.new { |hashz , keyz | hashz[keyz] = "purple #{keyz} !" } # Gives a block to default/assign to values for unassigned keys.
g = Hash.new { |key| key = "Ether"}  # => {}
puts " hfdsfjsdkfhsdkf"              # => nil
puts g["cracker"]  # Ether  
puts v             # {}
puts v["menu"]     # purple menu ! <-- {"menu" => "purple menu !"}
puts r["where"]    # nil
puts s["am"]       # nil
puts u[:just]      # make
puts t["here?"]    # 0 

# Interesting options. You can alter a Hash's default value after you've instantiated it. 
# Use the default value instantiation when you're starting off using a Hash by adding things to it, since you can't add to nil. 

l = Hash.new("lolcatz!")  # Create a Hash with all default keys as 'lolcatz!'
puts l["beyond the sun"]  # lolcatz!
l.default = "rofl"                      # Changes the default from "lolcatz!" to "rofl"
puts l["somewhere in unassigned land"]  # rofl

# To add a new key is the same for an existing OR new Hash

puts l[:realz] = "First value"      # {:realz => "First key"}
puts l[:newz]  = "Second value"     # {:realz => "First key", :newz=>"The second"}

# Adding a Hash and calling the nested hash's key's values.

dumhash = {"cat" => 10, "dog" => 20}  # => {"cat"=>10, "dog"=>20}

# newhash = {}(3)   # short error message (bad syntax, crashes)
# newhash = {}.(3)    # long  error message (good syntax, bad method call). equal to {}.call(3)  

puts l[:notes]                # rofl (the default)
puts l[:notes] = nil          # Nil. Assigns to nil
puts l[:hashy] = dumhash      # {"cat"=>10, "dog"=>20}  <-- just shows the dumhash Hash.
puts l                        # {blah blah, :hashy => {:symbolz => 10}}  
puts l[:hashy["cat"]]         # 10.
puts l[:hashy]                # {"cat"=>10, "dog"=>20}

# Using .keys and .values

p l.keys                     # [:realz, :newz, :notes, :hashy]   <-- All the .keys of the Hash. .keys returns an array.
p l.keys[1]                  # :news
p l.values  # => ["First value", "Second value", nil, {"cat"=>10, "dog"=>20}]
p l.values[3]                # Shows the value of the key :hashy, which is the imbedded Hash 'dumhash'

# Hashes with the same value 
lolly = {pot: "green", drugs: "green"}  # => {:pot=>"green", :drugs=>"green"}
p lolly[:pot].object_id     # Object_ID is different because the KEYS are different, despite the values of "green"
p lolly[:drugs].object_id   # being the same.

# >> 101
# >> 147
# >> 147
# >> 10
# >> 15
# >> 20
# >> Jery
# >> Wat?
# >> 666
# >> 
# >>  hfdsfjsdkfhsdkf
# >> Ether
# >> {}
# >> purple menu !
# >> 
# >> 
# >> make
# >> 0
# >> lolcatz!
# >> rofl
# >> First value
# >> Second value
# >> rofl
# >> 
# >> {"cat"=>10, "dog"=>20}
# >> {:realz=>"First value", :newz=>"Second value", :notes=>nil, :hashy=>{"cat"=>10, "dog"=>20}}
# >> rofl
# >> {"cat"=>10, "dog"=>20}
# >> [:realz, :newz, :notes, :hashy]
# >> :newz
# >> ["First value", "Second value", nil, {"cat"=>10, "dog"=>20}]
# >> {"cat"=>10, "dog"=>20}
# >> 70140872218560
# >> 70140872218540

