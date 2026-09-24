#!/bin/bash
# Double-click me (Mac) after adding, renaming or deleting pictures in slideshow/.
cd "$(dirname "$0")" || exit 1
python3 update_slideshow.py
echo
read -n 1 -s -r -p "Done - reload index.html in your browser. Press any key to close."
