#!/bin/bash

# Loop semua folder di direktori saat ini
find . -mindepth 1 -maxdepth 1 -type d | while read -r folder; do
  echo "Processing folder: $folder"
  cd "$folder" || continue

  i=1
  # Loop file saja (bukan folder), urutkan
  find . -maxdepth 1 -type f | sort | while read -r file; do
    ext="${file##*.}"                    # Ekstensi file
    base="${file##*/}"                   # Nama file tanpa path
    num=$(printf "%02d" $i)

    # Hindari nama file jadi "./01"
    newname="$num"
    [[ "$base" == *.* && "$base" != "$ext" ]] && newname="$num.$ext"

    if [[ "$base" != "$newname" ]]; then
      mv -i -- "$base" "$newname"
      echo "  Renamed: $base -> $newname"
    fi

    ((i++))
  done

  cd ..
done
