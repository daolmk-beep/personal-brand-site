#!/usr/bin/env bash
# EP01 최종 영상 합성 (무료·자동) — ffmpeg
#   입력: visuals/sNN.png (벡터 씬) + captures/*.png (실제 캡쳐) + audio/ep01-full.mp3
#   출력: youtube/assets/ep01-final.mp4 (1920x1080, H264+AAC)
#   실행: bash youtube/assets/build_video.sh
# 타임라인은 ep01-visual-prompts.md S1~S10 잠정 타임코드 기반(총 323s ≈ 음성 322.66s).
set -e
A="$(cd "$(dirname "$0")" && pwd)"          # youtube/assets
TMP="$A/.build"; CL="$TMP/clips"
rm -rf "$TMP"; mkdir -p "$CL"

# image|dur(s)|zoom(in/out)  — captures/* 는 다크 패딩 후 줌
ENTRIES=(
 "visuals/s01.png|23|in"
 "visuals/s02.png|18|out"
 "visuals/s03.png|27|in"
 "visuals/s04.png|10|in"
 "captures/deck_p27_football_field.png|20|in"
 "captures/xl_Football_Field-1.png|18|out"
 "visuals/s05.png|12|in"
 "captures/xl_Peer_Source_Validation-1.png|24|in"
 "captures/deck_p26_peer_sotp.png|18|out"
 "visuals/s06.png|12|in"
 "captures/xl_WACC_Source_Validation-1.png|15|in"
 "visuals/s07.png|14|in"
 "captures/xl_Valuation_Conclusion-1.png|15|in"
 "captures/deck_p28_valuation_conclusion.png|15|out"
 "visuals/s08.png|29|in"
 "visuals/s09.png|30|out"
 "visuals/s10.png|23|in"
)

i=0
for e in "${ENTRIES[@]}"; do
  IFS='|' read -r img dur dir <<< "$e"
  i=$((i+1)); n=$(printf "%02d" $i); frames=$((dur*30))
  zinc=$(awk "BEGIN{printf \"%.6f\", 0.09/$frames}")
  [ "$dir" = "in" ] && zexpr="z='min(1.0+$zinc*on,1.10)'" || zexpr="z='max(1.10-$zinc*on,1.0)'"
  zp="$zexpr:d=$frames:x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':s=1920x1080:fps=30"
  case "$img" in
    captures/*) pre="scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=0x0E1116,scale=2880:1620," ;;
    *)          pre="scale=2880:1620," ;;
  esac
  ffmpeg -y -loglevel error -loop 1 -i "$A/$img" -t "$dur" -r 30 \
    -vf "${pre}zoompan=${zp},setsar=1,format=yuv420p" \
    -c:v libx264 -preset veryfast -crf 20 -g 60 -keyint_min 60 -sc_threshold 0 "$CL/$n.mp4"
  echo "file '$n.mp4'" >> "$CL/list.txt"
  echo "clip $n  $img  ${dur}s  $dir"
done

echo "== concat =="
ffmpeg -y -loglevel error -f concat -safe 0 -i "$CL/list.txt" -c copy "$TMP/silent.mp4"
echo "== mux audio =="
ffmpeg -y -loglevel error -i "$TMP/silent.mp4" -i "$A/audio/ep01-full.mp3" \
  -c:v copy -c:a aac -b:a 192k -movflags +faststart "$A/ep01-final.mp4"
rm -rf "$TMP"
echo "== DONE -> $A/ep01-final.mp4 (자막 없음) =="

echo "== subtitles v2 (자막 151줄 + 숫자핀) =="
( python "$A/build/make_ass.py" || py "$A/build/make_ass.py" ) || echo "  (python 없음 — subs.ass 생성 건너뜀)"
if [ -f "$A/subs.ass" ]; then
  ( cd "$A" && ffmpeg -y -loglevel error -i ep01-final.mp4 -vf "ass=subs.ass" \
      -c:v libx264 -preset veryfast -crf 20 -c:a copy ep01-final-v2.mp4 )
  echo "== DONE -> $A/ep01-final-v2.mp4 (자막+핀 번인) =="
fi
ffprobe -v error -show_entries format=duration -of csv=p=0 "$A/ep01-final.mp4"
