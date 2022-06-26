function new_blog() {
    local cur_date=$(date +%F)
    local cur_time=$(date +%T)
    local local_utc_offset=$(date +%z)
    local title=$*
    file="$cur_date-"${title// /-}".markdown"
    content="---
layout: post
title: \"$title\"
permalink: /:title/
date:   $cur_date $cur_time $local_utc_offset
---
"
    if [ ! -f "$file" ]; then
        echo "$content" >> $file
        echo "Blog post created with the title: $title"
    else 
        echo "ERROR: Blog post with the title already exits, try a new title"
    fi
}
