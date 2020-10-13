output=$(mega-transfers --only-downloads)
if [[ $output == '' ]]; then
    echo "No Downloads." > file.txt
else
    mega-transfers --only-downloads | awk '{print "<span>"$0,"</span><br/>"}' > file.txt
fi