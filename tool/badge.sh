#!/usr/bin/env bash
# elan agent badge v2: shared layout for the Anvil / Forge / Picasso sessions.
#   card + gradient name ← Picasso · live mode ← Forge · status glyphs ← Anvil
# Zero dependencies: bash + git + a truecolor terminal. 22 cols wide.
#
#   bash tool/badge.sh            print once
#   bash tool/badge.sh -w [secs]  live: ◉ pulses every 1s, git refresh every N s (default 5)

set -uo pipefail

# ── identity: the only block each agent edits ──────────────────────────
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"   # git repo to watch
NAME="A N V I L"
REF="5905ed"
ROLE1="Flutter · Mobile"
ROLE2="Play · App Store"
REPO_LABEL="elan-flutter"
G1=(2 125 253)   # name gradient start (Flutter blue). Team: Forge=fire, Picasso=magenta
G2=(84 220 255)  # name gradient end (ice)
SELF=ANV         # this card's tag in TEAM
# Shared roster, identical in all three files: TAG:r,g,b (each agent's G1)
TEAM=(PIC:224,64,251 FRG:255,60,0 ANV:2,125,253 ATL:16,185,129)
art() {          # ≤ 19 visible cols per line
  echo "$(c 84 197 248)▄▄▄▄▄▄▄▄▄▄▄▄▄▄${R}"
  echo "$(c 180 185 195)▀▀▀███████████▀${R}"
  echo "$(c 140 145 155)     ▐█████▌${R}"
  echo "$(c 110 115 125)   ▄█████████▄${R}"
}
# ───────────────────────────────────────────────────────────────────────

E=$'\e'; R="${E}[0m"; B="${E}[1m"
c() { printf '%s[38;2;%s;%s;%sm' "$E" "$1" "$2" "$3"; }
ACC=$(c "${G1[@]}"); DIM=$(c 120 120 135); TXT=$(c 220 220 230)
OK=$(c 0 230 118); WARN=$(c 255 170 0); BAD=$(c 255 82 82); CYN=$(c 0 229 255)

W=20  # card interior width → 22 cols total
visible_len() { local s; s=$(printf '%s' "$1" | sed $'s/\e\\[[0-9;]*m//g'); echo "${#s}"; }
row() { local pad=$(( W - $(visible_len "$1") )); (( pad < 0 )) && pad=0
        printf '%s│%s%s%*s%s│%s\n' "$ACC" "$R" "$1" "$pad" '' "$ACC" "$R"; }
rule() { local l="$1" mid="$2" r="$3" fill; fill=$(printf '%*s' $(( W + 1 - ${#l} - $(visible_len "$mid") )) '' | sed 's/ /─/g')
         printf '%s%s%s%s%s%s%s\n' "$ACC" "$l" "$mid" "$ACC" "$fill" "$r" "$R"; }

gradient() {  # per-character truecolor blend G1 → G2
  local s="$1" n=${#1} i out=""
  for (( i=0; i<n; i++ )); do
    local t=$(( n > 1 ? i * 100 / (n - 1) : 0 ))
    out+="$(c $(( G1[0] + (G2[0]-G1[0])*t/100 )) $(( G1[1] + (G2[1]-G1[1])*t/100 )) $(( G1[2] + (G2[2]-G1[2])*t/100 )))${s:i:1}"
  done
  printf '%s%s%s' "$B" "$out" "$R"
}

roster() {  # ● self, ○ peers, each in that agent's colour
  local m tag rgb out=""
  for m in "${TEAM[@]}"; do
    tag=${m%%:*}; rgb=${m#*:}
    [[ $tag == "$SELF" ]] && out+=" $(c ${rgb//,/ })●${B}${tag}${R}" || out+=" $(c ${rgb//,/ })○${DIM}${tag}${R}"
  done
  printf '%s' "$out"
}

ago() { local s=$(( $(date +%s) - $1 ))
  if (( s < 3600 )); then echo "$(( s / 60 ))m"; elif (( s < 86400 )); then echo "$(( s / 3600 ))h"; else echo "$(( s / 86400 ))d"; fi; }

GIT_BR="-" GIT_SHA="" GIT_DIRTY=0 GIT_AGE="" GIT_AB=""
refresh_git() {
  GIT_BR=$(git -C "$ROOT" branch --show-current 2>/dev/null) || { GIT_BR="no repo"; return; }
  GIT_SHA=$(git -C "$ROOT" rev-parse --short=7 HEAD 2>/dev/null)
  GIT_DIRTY=$(git -C "$ROOT" status --porcelain 2>/dev/null | wc -l | tr -d ' ')
  GIT_AGE=$(ago "$(git -C "$ROOT" log -1 --format=%ct 2>/dev/null || date +%s)")
  local ab; ab=$(git -C "$ROOT" rev-list --left-right --count '@{u}...HEAD' 2>/dev/null) \
    && GIT_AB="↓${ab%%[[:space:]]*} ↑${ab##*[[:space:]]}" || GIT_AB="no upstream"
}

draw() {  # $1 = live tick (empty when printing once)
  local pulse state
  if [[ -n ${1:-} ]]; then (( $1 % 2 )) && pulse="${OK}◉" || pulse="${DIM}◉"; state="${pulse}${DIM} live "
  else state="${DIM}◆ snap "; fi
  local dirty; (( GIT_DIRTY == 0 )) && dirty="${OK}● clean${R}" || dirty="${WARN}● ±${GIT_DIRTY}${R}"

  rule "╭─ " "${state}${R}" "╮"
  while IFS= read -r l; do row " $l"; done < <(art)
  row ""
  row "  $(gradient "$NAME")"
  row "  ${DIM}◆${R} ${TXT}${ROLE1}${R}"
  row "  ${DIM}◆${R} ${TXT}${ROLE2}${R}"
  rule "├" "" "┤"
  row " ${CYN}⎇${R} ${TXT}${GIT_BR:0:9}${R} ${DIM}${GIT_SHA}${R}"
  row " ${dirty}  ${DIM}⨌${R} ${TXT}${GIT_AGE}${R}"
  row " ${DIM}${GIT_AB}${R}"
  row " ${DIM}[${REF}]${R} ${DIM}$(date +%H:%M:%S)${R}"
  rule "├" "" "┤"
  row "$(roster)"
  rule "╰─ " "${ACC}${REPO_LABEL} ${R}" "╯"
}

refresh_git
if [[ ${1:-} == -w || ${1:-} == --watch ]]; then
  every=${2:-5}; tick=0
  trap 'printf "%s[?25h\n" "$E"; exit 0' INT TERM
  printf '%s[?25l%s[H%s[2J%s[3J' "$E" "$E" "$E" "$E"   # clear screen + scrollback
  while :; do
    (( tick % every == 0 )) && refresh_git
    printf '%s[H' "$E"; draw $(( tick + 1 )); printf '%s[J' "$E"   # redraw in place: no flicker
    sleep 1; (( tick++ ))
  done
else
  [[ -t 1 ]] && printf '%s[H%s[2J%s[3J' "$E" "$E" "$E"   # full-only view: clear screen + scrollback (skipped when piped)
  draw
fi
