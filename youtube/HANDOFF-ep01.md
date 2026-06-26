# EP01 핸드오프 — 새 PC에서 이어서 (제작 단계)

> **작성:** 2026-06-26 · 이전 PC에서 기획·대본·메타 라인 종료, **제작(비주얼/캡쳐/음성) 단계 진입 직전**까지 완료.
> 새 PC에서는 이 문서 → `youtube/README.md` → `youtube/scripts/` 순으로 읽고 이어가면 됩니다.

---

## 0. 새 PC에서 지금 시작 — TEST 작업 (음성·썸네일)

> 테스트 작업은 **GreenPlus 엑셀 불필요**(대본만 사용). 새 PC는 아래 3단계만.

1. **저장소 최신화:** `git pull` (이 핸드오프·`ep01-voice-test.md` 포함)
2. **MCP 2개 등록** (이 PC엔 아직 없음 — §6 명령에 본인 키 채워 실행):
   - uv 설치 → fal 등록 → ElevenLabs 등록 → `claude mcp list`로 둘 다 ✔ 확인
   - 키는 비밀번호 관리자에 보관해 둔 fal/ElevenLabs 키 사용 (저장소엔 없음)
3. **Claude Code 세션 새로 시작** (MCP 도구는 세션 시작 시 로드됨) → "EP01 음성 테스트부터 시작" 이라고 지시

그러면 Claude가 `ep01-voice-test.md`의 컷 3종을 ElevenLabs로 생성(보이스 A/B) → voice_id 확정 → 이어서 썸네일 시안(fal Ideogram + 한글 오버레이) 진행.

---

## 1. 지금까지 (DONE)

기획·전략·대본 라인 100% 종료. 산출물:

| 파일                                         | 내용                                                                                 |
| -------------------------------------------- | ------------------------------------------------------------------------------------ |
| `youtube/README.md`                        | 채널 운용 레지스트리 — 정체성·가드레일·에피소드 현황                              |
| `youtube/scripts/ep01-valuation-engine.md` | **연출 대본** — 타임코드·화면/자막 큐·음성 디렉션·캡쳐 샷리스트 8컷        |
| `youtube/scripts/ep01-narration-clean.md`  | **TTS 클린 대본** — 순수 내레이션, 단문 분절, pause 마킹(줄바꿈/빈 줄/`…`) |
| `youtube/scripts/ep01-description.md`      | 설명란 본문 + 챕터(잠정) + 해시태그 + 고정댓글 + 리드마그넷 초안                     |

확정 사실(재논의 불필요):

- **제목:** AI로 Valuation(DCF) 자동화, 어디까지 가능하고 얼마나 신뢰할 수 있을까?
- **분량:** 클린 대본 본문 공백 제외 약 1,985자. 잠정 목표 ~6분 30초였으나 **TTS 실측 5분 22초(speed1.15 확정값)로 확정 → 최종 길이 목표 약 5분 30초.**
- **제작 컨셉 전환(2026-06-26):** **"Faceless · AI-Visual + Real-Evidence"** — 촬영 안 함. 영상 비주얼(말하는 화면·개념·b-roll·전환)은 **전부 AI 제작(경제명탐정 방식)**. 단 **밸류에이션 산출물(Football Field·검증 시트·결론)은 실제 엑셀/덱 캡쳐를 중간에 컷인**. 증거는 AI로 재현/위조하지 않음(= 차별 자산).
- **음성:** 고급 AI 음성, 경제명탐정 톤(차분·권위형), 경어체. 세팅 stability 55~65 · similarity 75 · speed 0.98~1.03. (디렉션 상세: 연출 대본 음성 디렉션 표)

## 2. 다음 할 일 (TODO — 제작 단계)

병렬 가능: 11·12·13 → 14에서 합침.

```
🟦 11. 엑셀/덱 실제 캡쳐 추출   ← 거의 완료(2026-06-26). 산출물 20장 → youtube/assets/captures/ (+ 매핑·주의사항 README)
       엑셀 10시트(시트별 PDF 읽기전용→pdftoppm 200DPI) + 덱 p25/26/27/28 (PowerPoint COM PNG). ★히어로: deck_p27(FF 막대), xl_Peer_Source_Validation(킬러)
       ⚠️ FF 슬라이드는 **27**(요청 30은 리스크맵). 덱 vs 엑셀 세부 숫자 불일치는 **패스 결정**(데모 시연 목적 — 덱·엑셀 자유 컷인, 최종범위·Equity는 일치). 상세: captures/README
       남은 일: 샷③(탭 줄=UI 윈도우 스크린샷)·샷⑧(블로그 evidence-first 화면 / Porter는 EP02 자산) 수작업 1~2장
🟦 12. AI 비주얼 영상 제작      ← S1~S10 베이스 씬 **10장 완성**: youtube/assets/visuals/s01~s10.png (1920×1080)
       ⚠️ **fal 막힘**(계정 inference 403 — 결제/키 이슈, §6 참고) → **무료 대안 채택: 헤드리스 Chrome HTML→PNG**(GPU·결제 불필요, 한글 정확, 무한 재생성). 소스 build/*.html + style.css([STYLE] 코드화). 재렌더: build/render.ps1
       남은 일: (a)자막/숫자핀 오버레이 템플릿(.lower3/.pin 준비됨) (b)무료 스톡 b-roll(Pexels 등) (c)CapCut/Resolve로 모션·싱크. 상세: assets/visuals/README
✅ 13. TTS 1차 녹음             ← 완료(2026-06-26). 산출물: youtube/assets/audio/ep01-full.mp3 (git 제외)
       보이스: Chris/iP95p4xoKVk53GoZ742B · multilingual_v2/ko · stab0.30·sim0.75·speed1.15·style0.45·boost on
       본문 전체 1회 생성, pause 마킹(줄바꿈/빈 줄/…) 그대로. **실측 러닝타임 5분 22.7초**(speed1.15 확정값 그대로 채택 → 목표 길이 5:30으로 재하향).
       ⚠️ ElevenLabs 무료 티어 API = 프리메이드만. 네이티브 한국어 보이스·Voice Design은 유료 전용(막힘). 상세: ep01-voice-test.md 확정값 메모
🟦 14. 합성·편집               ← **자동 합성 v2 완성**: youtube/assets/ep01-final-v2.mp4 (자막+핀 번인) / ep01-final.mp4 (자막 없는 클린본)
       1920×1080·H264+AAC·323s. ffmpeg로 10씬 + 실제 캡쳐 컷인 + Ken Burns 줌 + 음성 싱크 + **한글 자막 151줄(접근성 가드레일 충족) + 숫자핀 4개(230배·9.5%·5,850~7,150·869~1,062억)**
       재빌드 원커맨드: bash youtube/assets/build_video.sh (씬 PNG→클립→concat→음성 mux→자막 생성[build/make_ass.py]→번인). 자막 문구·타이밍 수정 = build/make_ass.py
       남은 폴리시(선택): (a)전환 디졸브(현재 하드컷) (b)타임코드 비트 정밀 싱크(현재 글자수 비례 추정) (c)무료 스톡 b-roll 보강
✅ 15. 러닝타임 실측 → 챕터 타임코드 확정 ← 완료. 영상 5:23 실측 = 씬 경계. ep01-description.md 챕터 10개를 실제 컷 지점(0:00/0:23/0:41/1:08/1:56/2:50/3:17/4:01/4:30/5:00)으로 교체 완료
✅ 16. 한글 자막·숫자 핀 / 썸네일 ← 자막 151줄+핀 4개 = 영상 v2 번인 완료. 썸네일 **B안 확정**: assets/thumbnails/ep01-thumbnail.png ("비교기업 230배?" 1280×720, 무료 HTML→PNG). A안=thumb_a.png 보관(A/B 테스트). 수정: thumbnails/build/*.html
✅ 17. 리드마그넷 PDF 디자인·배포 ← **완료+배포검증**. assets/leadmagnet/ep01-valuation-checklist.pdf (A4 1장, 소스 leadmagnet/build/checklist.html)
       public/에 복사 → main push(7357c3e) → GitHub Pages 배포 → **URL 라이브 확인(HTTP 200)**: https://daolmk-beep.github.io/personal-brand-site/ep01-valuation-checklist.pdf
       설명란·고정댓글 다운로드 링크 작동. (선택)이메일 리드 수집 폼은 추후.
✅ 18. 발행 전 체크리스트 (README §5) ← 점검 완료. 결과: 대부분 충족(실물 캡쳐·전구간 자막·블로그+리드마그넷 링크 OK). 주의 2: (a)덱 푸터 'CONFIDENTIAL' 보일러플레이트=영상에서 크롭 권장(내용 비밀 아님) (b)§5 '본인 목소리' 항목은 채널 AI음성 확정으로 대체됨(ep01-full.mp3). 업로드 전 PDF 배포(17) 필요
⬜ 19. 업로드 + 설명란/고정댓글 게시
```

**바로 착수 추천:** ✅ 씬별 비주얼 프롬프트 시트(`youtube/scripts/ep01-visual-prompts.md`) **작성 완료**(2026-06-26) — S1~S10 씬 분절·글로벌 스타일 토큰·AI 영문 프롬프트·한글 자막/숫자 핀(코드 오버레이)·8컷 캡쳐 컷인 매핑·잠정 타임코드. 이제 11(캡쳐 추출)·12(AI 비주얼) **동시 착수 가능.** 12 다음 액션 = 키 비주얼 1장 생성해 톤 확정 → fal 일괄.

## 3. 데모 자산 위치 (★ 새 PC로 옮겨야 함)

밸류에이션 엑셀 — **이 저장소 밖에 있음. 별도 복사 필요:**

```
C:\Claude-Code\IB-Investment-House\04_MA-Deals\Project-GreenPlus\03_Valuation-Model\
  Valuation_ProjectGreenPlus_v6_consistency_locked_ex_LBO_20260519.xlsx
```

- 시트(검증됨): Assumptions / WACC / **WACC_Source_Validation** / DCF / SOTP / Peer_Multiples / LBO / Valuation_Conclusion / **Football_Field** / Peer_Upside_Case / **Peer_Source_Validation**
- 캡쳐 샷리스트 8컷이 가리키는 시트는 모두 실존 확인 완료.
- 덱: Football Field 슬라이드 (블로그 `case/atlas-valuation-football-field.png` 류).
- GreenPlus = 공개자료(DART·웹서치) 연습 케이스 → NDA 무관, 실명·산출물 노출 OK.

## 4. 가드레일 (제작 시 반드시)

1. **산출물 캡쳐는 실물.** Football Field·검증 시트·결론은 실제 엑셀/덱 스크린샷. AI 재현 금지.
2. AI는 래퍼(비주얼 베이스·개념·b-roll·전환·썸네일)만.
3. 실제 의뢰 건(Jellyfish/Sungjin/RMK) 화면 사용 금지. GreenPlus만 사용.
4. 전 구간 한글 자막(무음 시청 대응) + 숫자 핀.
5. 챕터 타임코드는 편집 실측 후 교체(현재 description은 잠정값).

## 5. 캡쳐 보관 규칙

- 추출한 스크린샷 → `youtube/assets/captures/` (마스킹 불필요, 공개자료).
- 썸네일 시안 → `youtube/assets/thumbnails/`.
- ※ 현재 두 폴더는 비어 있어 git에 안 올라감(빈 디렉터리). 캡쳐 추가 시 자동 추적됨.

## 6. 도구 스택 & 새 PC 재설정 (MCP) ★멀티 PC 필수

제작 도구 스택(확정):

- 🎙️ **음성 = ElevenLabs** (MCP, free 티어 월 10,000자 — EP01 제작 충분)
- 🖼️ **이미지 = fal** (MCP, Ideogram v3·Flux 등). 썸네일 **한글 텍스트는 코드 오버레이**(모델 한글 깨짐 방지)
- 🎬 영상 생성 = 미정 (추후, fal 비디오 모델로 같은 키 확장 가능)
- ✂️ 편집·업로드 = 사람

**MCP는 머신별 로컬 등록 → 새 PC마다 아래 재설정 필요** (키 자체는 클라우드 계정이라 어느 PC서든 동일):

```bash
# 1) uv 설치 (ElevenLabs MCP 구동용) — PowerShell
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"

# 2) fal 등록 (HTTP, 로컬 설치 불필요)
claude mcp add --transport http fal-ai https://mcp.fal.ai/mcp \
  --header "Authorization: Bearer <FAL_KEY>" --scope user

# 3) ElevenLabs 등록
claude mcp add elevenlabs --scope user \
  -e ELEVENLABS_API_KEY=<ELEVEN_KEY> \
  -e ELEVENLABS_MCP_BASE_PATH=<레포경로>/youtube/assets/audio \
  -e ELEVENLABS_MCP_OUTPUT_MODE=files \
  -- "<uvx.exe 경로>" elevenlabs-mcp

# 4) 확인
claude mcp list   # 둘 다 ✔ Connected
```

- ElevenLabs 첫 실행은 패키지 다운로드로 **헬스체크가 1회 실패**할 수 있음 → 한 번 더 `claude mcp list`하면 연결됨.
- **MCP 추가 후 Claude Code 세션을 새로 시작해야 도구가 활성화됨.**

⚠️ **키 보관:** `<FAL_KEY>`/`<ELEVEN_KEY>`는 **저장소 커밋 금지**(user 스코프 = `~/.claude.json`). 비밀번호 관리자에 보관. 현재 키는 채팅으로 1회 노출됐으니 보안 우려 시 대시보드에서 재발급 후 위 명령으로 재등록.

## 7. 참조

- 블로그 글: `src/content/blog/evidence-first.md` (URL: https://daolmk-beep.github.io/personal-brand-site/blog/evidence-first)
- 메모리: `youtube-channel-concept` (채널 컨셉, 2026-06-26 제작방식 갱신 반영)
- 다음 편 예고: 공개자료만으로 IM 산업분석 페이지 Porter 5F 자동 생성 (EP02).
