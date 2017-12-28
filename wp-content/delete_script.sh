find ./ -type f | while read line; do
	base_filename=$(basename "$line")
	found=$(grep -r "$base_filename" ../_posts)
	if [ -z "$found" ]; then
		sudo mv "$line" ~/Desktop/temp
	fi

done
