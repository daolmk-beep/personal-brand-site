# LedgerLab YouTube 제작 플레이북

> 새 PC에서 `git pull` 후 이 문서 하나로 전체 파이프라인 재현 가능.
> 모든 작업은 **결제·GPU 0원 (로컬 무료 스택)**. fal 쓰지 않음(아래 참조).

---

## 0. 이 파이프라인의 핵심 원칙

| 구성요소 | 도구 | 비고 |
|---|---|---|
| AI 음성 | ElevenLabs MCP (Chris) | 무료 티어 = 프리메이드 보이스만 가능 |
| 씬 비주얼·썸네일 | 헤드리스 Chrome HTML→PNG | 해상도·한글 완벽, 무한 재생성 |
| 엑셀·덱 캡쳐 | Office COM (PowerShell) + pdftoppm | 실제 산출물 = 증거우선 차별자산 |
| 영상 합성 | ffmpeg (Ken Burns + 음성 mux) | 씬 PNG + 캡쳐 컷인 |
| 자막 | Python ASS 생성 → ffmpeg 번인 | 151줄 + 숫자 핀 |
| PDF 리드마그넷 | Chrome `--print-to-pdf` | |
| 배포 | GitHub Pages (`public/`) | push → 자동 빌드 |

> **fal MCP**: model 검색(read)은 되나 inference 호출이 403 Forbidden(계정 결제/키 이슈). EP02에서도 fal 재시도 하지 말 것 — 무료 Chrome 파이프라인이 더 빠르고 한글 정확도도 높음.

---

## 1. 새 PC 환경 세팅 체크리스트

### 1-A. 필수 도구 설치

```powershell
# ffmpeg (WinGet)
winget install ffmpeg

# Poppler (pdftoppm — 엑셀 PDF → PNG 변환용)
winget install poppler

# Python 3 (자막 ASS 생성)
winget install Python.Python.3

# Chrome은 이미 설치돼 있다고 가정 (없으면 winget install Google.Chrome)
```

- **Microsoft Office** (Excel + PowerPoint): Office COM이 필요하므로 반드시 설치.
- **Git**: `winget install Git.Git`

### 1-B. API 키 등록 (저장소에 커밋 금지)

```bash
# ElevenLabs — Claude Code user scope (~/.claude.json)
claude mcp add elevenlabs --scope user -- npx -y @elevenlabs/mcp ELEVEN_KEY=<your_key>

# fal (현재 inference 불가 상태, 필요시 billing 해결 후 재등록)
# claude mcp add fal --scope user -- npx -y @fal-ai/mcp FAL_KEY=<your_key>
```

> 키는 대시보드에서 재발급 후 위 명령으로 등록. 채팅/파일에 절대 노출 금지.

### 1-C. 저장소 클론 & 확인

```bash
git clone https://github.com/daolmk-beep/personal-brand-site.git
cd personal-brand-site

# 설치 확인
ffmpeg -version | head -1
pdftoppm -v
python --version
```

---

## 2. 에피소드 폴더 규약

```
youtube/
├─ PLAYBOOK.md              ← 이 문서 (멀티PC 동기화 기준)
├─ README.md                ← 채널 운용 레지스트리
├─ HANDOFF-ep01.md          ← EP01 작업일지 (완료)
├─ scripts/
│  ├─ ep01-narration-clean.md   ← TTS 입력용 클린 대본
│  ├─ ep01-visual-prompts.md    ← 씬별 HTML 제작 지시서
│  └─ ep01-description.md       ← 설명란·챕터·고정댓글
└─ assets/
   ├─ .gitignore            ← *.mp4 *.mp3 등 대용량 제외
   ├─ audio/                ← ep0N-full.mp3 (gitignored)
   ├─ captures/             ← 엑셀/덱 PNG 캡쳐 (커밋됨)
   │  └─ README.md          ← 파일명 ↔ 슬라이드/시트 매핑
   ├─ visuals/
   │  ├─ build/             ← s0N.html + style.css + render.ps1
   │  └─ s01.png … s10.png  ← 렌더 결과 (커밋됨)
   ├─ thumbnails/
   │  ├─ build/             ← thumb_a.html, thumb_b.html
   │  └─ ep01-thumbnail.png ← 확정 썸네일 (커밋됨)
   ├─ leadmagnet/
   │  ├─ build/checklist.html
   │  └─ ep0N-checklist.pdf ← 리드마그넷 PDF (커밋됨)
   ├─ build/
   │  └─ make_ass.py        ← ASS 자막 생성 스크립트
   ├─ build_video.sh        ← 전체 합성 스크립트
   └─ subs.ass              ← 생성된 자막 파일 (커밋됨)

public/
└─ ep0N-valuation-checklist.pdf  ← GitHub Pages 배포용 (커밋됨)
```

---

## 3. 제작 단계별 절차

### Step 1 — TTS 음성 생성 (ElevenLabs MCP)

**확정 보이스 세팅 (EP01 기준, EP02에도 동일 적용)**

| 파라미터 | 값 |
|---|---|
| voice_id | `iP95p4xoKVk53GoZ742B` (Chris) |
| model_id | `eleven_multilingual_v2` |
| stability | 0.30 |
| similarity_boost | 0.75 |
| speed | **1.15** |
| style | 0.45 |
| use_speaker_boost | true |
| language_code | ko |

```
# Claude Code에서 MCP 호출 예시
mcp__elevenlabs__text_to_speech({
  voice_id: "iP95p4xoKVk53GoZ742B",
  text: "<대본 전문>",
  model_id: "eleven_multilingual_v2",
  output_format: "mp3_44100_128",
  voice_settings: { stability: 0.30, similarity_boost: 0.75,
                    speed: 1.15, style: 0.45, use_speaker_boost: true },
  language_code: "ko"
})
```

- 출력 파일: `youtube/assets/audio/ep0N-full.mp3` (gitignored)
- EP01 결과: 5:22.7 (322.66s), speed 1.15 적용 후 자연스러운 속도 확인됨.
- 무료 티어 제한: **프리메이드 보이스(Chris 포함)만 가능**. Voice Design·Native Voice는 유료 전용.

---

### Step 2 — 엑셀 캡쳐 (Office COM + pdftoppm)

```powershell
$xl = New-Object -ComObject Excel.Application
$xl.Visible = $false
$wb = $xl.Workbooks.Open("C:\path\to\model.xlsx", $false, $true)  # ReadOnly

foreach ($ws in $wb.Worksheets) {
    $name = $ws.Name -replace '[\\/:*?"<>|]','_'
    $pdf  = "C:\output\xl_$name.pdf"
    $png  = "C:\output\xl_$name.png"

    # UsedRange.Address()는 메서드 호출 — 괄호 필수 (PS5.1 파라미터 속성 버그)
    $addr = $ws.UsedRange.Address()

    $ws.ExportAsFixedFormat(0, $pdf, 2, $false, $false,
        $ws.UsedRange.Row, $ws.UsedRange.Column,
        $ws.UsedRange.Row + $ws.UsedRange.Rows.Count - 1,
        $ws.UsedRange.Column + $ws.UsedRange.Columns.Count - 1)

    # PDF → PNG @ 200DPI
    pdftoppm -r 200 -png -f 1 -l 1 $pdf ($png -replace '\.png$','')
    # 결과: xl_시트명-1.png
}
$wb.Close($false); $xl.Quit()
```

> **주의**: `ExportAsFixedFormat`이 일부 시트에서 "value does not fall within expected range" 오류 → 해당 시트 건너뜀(LBO 시트 등 숨김/보호 시트).

---

### Step 3 — 덱 캡쳐 (PowerPoint COM)

```powershell
$ppt = New-Object -ComObject PowerPoint.Application
$prs = $ppt.Presentations.Open("C:\path\to\deck.pptx", $true, $false, $false)

# 슬라이드 번호 확인 (제목 스캔)
for ($i = 1; $i -le $prs.Slides.Count; $i++) {
    Write-Host "$i : $($prs.Slides($i).Name)"
}

# 특정 슬라이드 PNG 내보내기
$slide = $prs.Slides(27)  # Football Field = 슬라이드 27 (숫자 믿지 말고 위에서 확인)
$slide.Export("C:\output\deck_p27_football_field.png", "PNG", 1920, 1080)

$prs.Close(); $ppt.Quit()
```

> **주의**: 덱에 적힌 슬라이드 번호(e.g. "30p")와 실제 COM 인덱스가 다를 수 있음. 반드시 위 스캔으로 확인.

---

### Step 4 — 씬 비주얼 생성 (헤드리스 Chrome HTML→PNG)

**render.ps1 핵심 로직** (`youtube/assets/visuals/build/render.ps1` 참조)

```powershell
$chrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$build  = "C:\Claude-Code\personal-brand-site\youtube\assets\visuals\build"
$out    = "C:\Claude-Code\personal-brand-site\youtube\assets\visuals"

foreach ($n in @("s01","s02","s03","s04","s05","s06","s07","s08","s09","s10")) {
    $png  = Join-Path $out "$n.png"
    $url  = "file:///" + (Join-Path $build "$n.html").Replace('\','/')

    # GUID user-data-dir 필수 — 공유 프로필 사용 시 Chrome 인스턴스 재활용으로 첫 컷만 캡쳐됨
    $prof = Join-Path $env:TEMP ("chrome_shot_" + [guid]::NewGuid().ToString("N"))

    $args = @(
        "--headless","--disable-gpu","--no-sandbox","--hide-scrollbars",
        "--user-data-dir=$prof","--no-first-run","--no-default-browser-check",
        "--force-device-scale-factor=1","--window-size=1920,1080",
        "--virtual-time-budget=3000","--screenshot=$png", $url
    )
    & $chrome @args
    Start-Sleep -Milliseconds 800
    Remove-Item $prof -Recurse -Force -ErrorAction SilentlyContinue
}
```

**[STYLE] 토큰** (`style.css` 공유 변수):

```css
--ink:   #0E1116   /* 다크 차콜 배경 */
--navy:  #16202e   /* 딥 네이비 */
--amber: #E8B33D   /* 강조 */
--red:   #D64545   /* 포렌식 레드 */
/* 블루프린트 그리드: 48px × 48px 선 opacity .07 */
/* 비네트: box-shadow inset 0 0 260px 60px rgba(0,0,0,.72) */
/* 폰트: Malgun Gothic (한글 정확도) */
```

> **썸네일**도 같은 방법. `--window-size=1280,720`으로 변경.

---

### Step 5 — 영상 합성 (ffmpeg)

**`build_video.sh`** 실행 방법 (Git Bash):

```bash
cd youtube/assets
bash build_video.sh
# 출력: ep01-final.mp4 (자막 없는 클린본)
# 이후 Step 6에서 자막 번인 → ep01-final-v2.mp4
```

**Ken Burns 줌 공식** (씬 카드용):

```bash
# zinc = (목표배율-1.0) / (총프레임-1)  — 보통 목표 1.10, 1.05 등
zoompan=z='min(1.0+zinc*on,1.10)':d=$frames:x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':s=1920x1080:fps=30,setsar=1,format=yuv420p
```

**캡쳐 컷인** (원본 비율 유지 + 다크 패딩):

```bash
scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=0x0E1116
```

**concat.txt 규칙** — ffmpeg는 Windows에서 `/c/Users/...` POSIX 경로 해석 불가. concat.txt와 ffmpeg를 **같은 디렉터리에서 상대 경로**로 실행:

```
# concat.txt (clips/ 안에서 상대 경로)
file 'clip_s01.mp4'
file 'clip_cap_deck_p27.mp4'
...
```

```bash
cd youtube/assets/clips
ffmpeg -f concat -safe 0 -i concat.txt -c copy ../ep01-raw.mp4
```

**오디오 mux**:

```bash
ffmpeg -i ep01-raw.mp4 -i audio/ep01-full.mp3 \
  -map 0:v:0 -map 1:a:0 \
  -c:v copy -c:a aac -b:a 192k -movflags +faststart \
  ep01-final.mp4
```

---

### Step 6 — 자막 생성 + 번인

**`make_ass.py`** 실행:

```bash
cd youtube/assets
python build/make_ass.py   # → subs.ass 생성
```

**ASS 스타일 정의**:

| 스타일 | 용도 | 세팅 |
|---|---|---|
| Cap | 전 구간 자막 | Malgun Gothic 50pt, 하단 중앙, 흰색, 다크 아웃라인+그림자 |
| Pin | 숫자 강조 핀 | 74pt, 상단 우측, 앰버 배경 다크 텍스트 |

**자막 번인**:

```bash
ffmpeg -i ep01-final.mp4 -vf "ass=subs.ass" \
  -c:v libx264 -crf 18 -preset slow \
  -c:a copy ep01-final-v2.mp4
```

---

### Step 7 — 리드마그넷 PDF

```powershell
$chrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$html   = "file:///C:/Claude-Code/personal-brand-site/youtube/assets/leadmagnet/build/checklist.html"
$pdf    = "C:\Claude-Code\personal-brand-site\youtube\assets\leadmagnet\ep0N-checklist.pdf"
$prof   = Join-Path $env:TEMP ("chrome_pdf_" + [guid]::NewGuid().ToString("N"))

& $chrome --headless --disable-gpu --no-sandbox `
  "--user-data-dir=$prof" `
  "--print-to-pdf=$pdf" `
  "--print-to-pdf-no-header" `
  $html

# GitHub Pages 배포
Copy-Item $pdf "C:\Claude-Code\personal-brand-site\public\ep0N-valuation-checklist.pdf"
```

> 1페이지 오버플로우 확인: `pdftoppm -r 100 -png checklist.pdf preview` 후 preview-1.png, preview-2.png 유무 체크.

---

### Step 8 — 커밋 & 푸시

**gitignore 확인** (`youtube/assets/.gitignore`):

```
*.mp4
*.mov
*.webm
*.mp3
*.wav
```

**커밋할 파일 목록**:

- `youtube/assets/captures/*.png` — 엑셀/덱 캡쳐
- `youtube/assets/visuals/s0N.png` — 씬 비주얼
- `youtube/assets/visuals/build/*.html`, `style.css`, `render.ps1`
- `youtube/assets/thumbnails/ep0N-thumbnail.png`
- `youtube/assets/thumbnails/build/*.html`
- `youtube/assets/leadmagnet/ep0N-checklist.pdf`
- `youtube/assets/leadmagnet/build/checklist.html`
- `youtube/assets/subs.ass`
- `youtube/assets/build/make_ass.py`
- `youtube/assets/build_video.sh`
- `youtube/scripts/ep0N-*.md`
- `youtube/HANDOFF-ep0N.md`
- `public/ep0N-valuation-checklist.pdf`

```bash
git add youtube/ public/ep0N-valuation-checklist.pdf
git status   # mp4/mp3 없는지 재확인
git commit -m "content(youtube): EP0N 제작 산출물 추가"
git push
```

---

## 4. 알려진 문제 & 해결법

| 문제 | 원인 | 해결 |
|---|---|---|
| Chrome headless — 첫 씬만 캡쳐됨 | 루프 내 동일 `--user-data-dir` 재사용 → 기존 인스턴스 재활용 | 호출마다 `[guid]::NewGuid()` 기반 임시 프로필 디렉터리 생성 |
| ffmpeg concat 경로 오류 (`C:/c/Users/...`) | Git Bash의 POSIX 경로 `/c/...`를 ffmpeg가 Windows에서 이중 해석 | `concat.txt`를 clips 디렉터리 안에 두고 상대 경로 사용, ffmpeg도 clips에서 실행 |
| `ws.UsedRange.Address` 타입 오류 | PS5.1에서 파라미터 속성은 메서드 호출 필요 | `ws.UsedRange.Address()` (괄호 추가) |
| Excel `ExportAsFixedFormat` 범위 오류 | 숨김/보호 시트 또는 빈 시트 | 해당 시트 `try/catch`로 건너뜀 |
| PDF 2페이지 오버플로우 | 콘텐츠 높이 > A4 | h1 폰트(22pt), 패딩 축소. pdftoppm으로 페이지 수 확인 후 조정 |
| PowerShell `-replace` 우선순위 오류 | `"str" + (Join-Path ... -replace '\\','/')` 파싱 오류 | `.Replace('\','/')` 메서드 방식으로 변경 |

---

## 5. 에피소드별 타임라인 템플릿

> EP01 기준 — 다음 에피소드는 씬 수·길이를 조정하되 구조 유지.

| 구간 | 씬 | 길이 | 내용 |
|---|---|---|---|
| 인트로 후킹 | S01 | ~23s | 핵심 질문 타이포 카드 |
| 소개 | S02 | ~18s | 채널·스피커 포지셔닝 |
| 개요 | S03 | ~27s | 오늘 만들 것 — 엔진 흐름도 |
| 결과 한 장 | S04 + deck_p27 + xl_FF | ~48s | Football Field 데모 |
| 킬러 씬 | S05 + xl_Peer_Source | ~36s | 230배 이상치 제외 |
| WACC | S06 + xl_WACC_Source | ~27s | 할인율 출처 검증 |
| 수렴 | S07 + xl_Val + deck_p26,28 | ~44s | 최종 밸류에이션 |
| 확장 | S08 | ~29s | 실사·산업분석으로 |
| 철학 | S09 | ~30s | 자동화의 끝은 사람 |
| 마무리/CTA | S10 | ~23s | 구독·PDF 유도 |
| **합계** | | **~323s (5:23)** | |

---

## 6. EP02 체크리스트 (Porter 5F IM 산업분석)

- [ ] 대본 (ep02-narration-clean.md) 확정
- [ ] 씬 비주얼 계획 (ep02-visual-prompts.md)
- [ ] 공개자료 캡쳐 준비 (DART·웹서치 결과 — NDA 무관)
- [ ] `build_video.sh` 복사 후 타임라인 수정
- [ ] `make_ass.py` 복사 후 PARAS/PINS 수정
- [ ] 리드마그넷 HTML 수정 → PDF 생성
- [ ] 썸네일 HTML 신규 제작 (같은 [STYLE] 토큰)
- [ ] `HANDOFF-ep02.md` 작업일지 생성
