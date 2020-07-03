def nyc_pigeon_organizer(data)
  # We need a complete array of pigeons, so we can make our keys
  # Combine gender -> male and gender -> female into one array.
  combined_names = data[:gender][:male] + data[:gender][:female]
  
  # These names need to be in a new hash as keys
  # Create a new hash
  pivoted_hash = {}
  
  # Loop over combined_names array and store the keys color gender, and lives
  combined_names.each do |pigeon_name|
    pivoted_hash[pigeon_name] = {
      :color => [],
      :gender => [],
      :lives => []
    }
  end
  
  # Now we need to loop over the keys in the data given to us.
  pivoted_hash.each do |parent_key, parent_hash|
    # parent_key will either be color, gender or lives.  parent_hash is color => purple for example.
    
    # Loop over the parent_hashes.  This will return the nested keys in the hash, such as color -> purple -> array_of_names for example.
    parent_hash.each do |child_key, child_array|
      # Now we have color, gender, or lives in parent_key
      # Now we have color -> purple, color -> white, gender -> male, gender -> female, and lives and its children available to us.
      # We need to loop over each child array to get the names of each corresponding pigeon and store them into our pivoted_hash
      child_array.each do |pigeon_name|
        #pigeon name consists of "Theo", or "Peter. Jr".  These names are keys in our pivoted hash.  
        pivoted_hash[pigeon_name][parent_key].push(child_key)
      end
    end
  end
  puts pivoted_hash
  pivoted_hash
end