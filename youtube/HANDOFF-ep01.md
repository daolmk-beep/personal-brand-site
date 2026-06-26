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

| 파일 | 내용 |
|---|---|
| `youtube/README.md` | 채널 운용 레지스트리 — 정체성·가드레일·에피소드 현황 |
| `youtube/scripts/ep01-valuation-engine.md` | **연출 대본** — 타임코드·화면/자막 큐·음성 디렉션·캡쳐 샷리스트 8컷 |
| `youtube/scripts/ep01-narration-clean.md` | **TTS 클린 대본** — 순수 내레이션, 단문 분절, pause 마킹(줄바꿈/빈 줄/`…`) |
| `youtube/scripts/ep01-description.md` | 설명란 본문 + 챕터(잠정) + 해시태그 + 고정댓글 + 리드마그넷 초안 |

확정 사실(재논의 불필요):
- **제목:** AI로 Valuation(DCF) 자동화, 어디까지 가능하고 얼마나 신뢰할 수 있을까?
- **분량:** 클린 대본 본문 공백 제외 약 1,985자 → **길이 목표 ~6분 30초**로 하향 확정(원본 대본 자체가 5.7분 분량이라 9분 30초 미달 → 보강 대신 목표 하향 결정).
- **제작 컨셉 전환(2026-06-26):** **"Faceless · AI-Visual + Real-Evidence"** — 촬영 안 함. 영상 비주얼(말하는 화면·개념·b-roll·전환)은 **전부 AI 제작(경제명탐정 방식)**. 단 **밸류에이션 산출물(Football Field·검증 시트·결론)은 실제 엑셀/덱 캡쳐를 중간에 컷인**. 증거는 AI로 재현/위조하지 않음(= 차별 자산).
- **음성:** 고급 AI 음성, 경제명탐정 톤(차분·권위형), 경어체. 세팅 stability 55~65 · similarity 75 · speed 0.98~1.03. (디렉션 상세: 연출 대본 음성 디렉션 표)

## 2. 다음 할 일 (TODO — 제작 단계)

병렬 가능: 11·12·13 → 14에서 합침.

```
⬜ 11. 엑셀/덱 실제 캡쳐 추출   ← 샷리스트 8컷(연출 대본 하단). 데모 ①~④용 스크린샷
⬜ 12. AI 비주얼 영상 제작      ← 말하는 화면·개념·b-roll·전환 (경제명탐정 방식)
⬜ 13. TTS 1차 녹음             ← ep01-narration-clean.md 투입
⬜ 14. 합성·편집               ← AI 비주얼 위에 ⑪ 캡쳐 컷인 + 내레이션 싱크
⬜ 15. 러닝타임 실측 → 챕터 타임코드 확정 (description의 잠정값 교체)
⬜ 16. 한글 자막·숫자 핀 / 썸네일
⬜ 17. 리드마그넷 PDF 디자인·배포 세팅 (ep01-description.md 초안 기반)
⬜ 18. 발행 전 체크리스트 (README 섹션 5)
⬜ 19. 업로드 + 설명란/고정댓글 게시
```

**바로 착수 추천:** 12번 AI 비주얼 제작용 **씬별 비주얼 프롬프트 시트**(챕터마다 화면 묘사 + 캡쳐 컷인 지점)는 아직 미작성. 이걸 먼저 만들면 11·12 동시 착수 가능. (이전 PC에서 사용자가 다음 작업으로 지목한 항목.)

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
