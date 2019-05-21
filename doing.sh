#!/usr/bin/env bash

# USAGE:
#   $doing.sh My super hero task
#
# 'My super hero task' get pushed into the doing file with a basic time stamp and some simple formatting

# Path to the 'doing' file, if this doesn't exist one will be created (see below)
# Edit this path to suit you
# The format is markdown compatible, 
DOING_FILE="~/doing.md"

# the entry prefix, a tab and hyphen, so markdown parsers can render it
PREFIX="	-"

# The date now as yyyy-MM-dd HH:mm - e.g. 2019-05-25 21:56
now=`date '+%F %H:%M'`

# the specified task you want logging
task="$@"

# A doing file needs to exist, if it doesn't one will be created
# It should start with 'Current:'
# followed by 3 blank lines
# and then 'Archived'
# 
# Current:
#
#
#
# Archived: 
if ! test -f $DOING_FILE; then
  echo "$DOING_FILE does not exist!, creating" >&2
  echo "Current:"> $DOING_FILE
  echo "">> $DOING_FILE
  echo "">> $DOING_FILE
  echo "Archived:">> $DOING_FILE
  echo "">> $DOING_FILE
fi

#
if [ "$task" == "" ]; then
    echo "No task provided" >&2
else
	# inserts text at line 3 of the doing file
	sed -i '' '3s/^/'"$PREFIX"' '"$now"' | '"$task"'\'$'\n/' "$DOING_FILE"
	echo "Added new task"
fi
