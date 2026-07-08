#!/bin/bash
ART_CACHE="$HOME/.cache/eww-media-art.png"

resolve_art() {
  local url="$1"
  if [ -z "$url" ]; then
    echo ""
    return
  fi
  if [[ "$url" == file://* ]]; then
    echo "${url#file://}"
    return
  fi
  if [[ "$url" == http://* || "$url" == https://* ]]; then
    if [ -f "$HOME/.cache/eww-media-art-url" ] && [ "$(cat "$HOME/.cache/eww-media-art-url")" = "$url" ] && [ -s "$ART_CACHE" ]; then
      echo "$ART_CACHE"
      return
    fi
    curl -s -o "$ART_CACHE" "$url" 2>/dev/null
    if [ -s "$ART_CACHE" ]; then
      echo "$url" > "$HOME/.cache/eww-media-art-url"
      echo "$ART_CACHE"
    else
      echo ""
    fi
    return
  fi
  echo ""
}

print_media() {
  status=$(playerctl status 2>/dev/null)
  if [ -z "$status" ]; then
    jq -nc '{active:false,status:"",title:"",artist:"",art:"",pct:0}'
    return
  fi
  title=$(playerctl metadata title 2>/dev/null)
  artist=$(playerctl metadata artist 2>/dev/null)
  art_url=$(playerctl metadata mpris:artUrl 2>/dev/null)
  art=$(resolve_art "$art_url")
  pos=$(playerctl position 2>/dev/null)
  len_us=$(playerctl metadata mpris:length 2>/dev/null)
  pos=${pos:-0}
  len_us=${len_us:-0}
  len=$(awk -v l="$len_us" 'BEGIN{printf "%d", l/1000000}')
  pct=$(awk -v p="$pos" -v l="$len" 'BEGIN{if(l>0){printf "%d", (p/l)*100}else{print 0}}')
  jq -nc \
    --arg status "$status" \
    --arg title "$title" \
    --arg artist "$artist" \
    --arg art "$art" \
    --argjson pct "$pct" \
    '{active:true,status:$status,title:$title,artist:$artist,art:$art,pct:$pct}'
}

print_media