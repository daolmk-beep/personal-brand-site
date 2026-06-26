# EP01 — 씬별 비주얼 프롬프트 시트 (AI 비주얼 제작용)

> **용도:** TODO 12(AI 비주얼 제작) 착수 시트. 내레이션 문단(10개)을 씬으로 분절 → 각 씬의 **AI 이미지/모션 프롬프트(fal Ideogram·Flux 투입용 영문)** + **한글 자막/숫자 핀(코드 오버레이)** + **실제 캡쳐 컷인 지점(8컷 매핑)** + **전환**을 정의.
> **연동:** 내레이션 = `ep01-narration-clean.md` · 화면/캡쳐 큐 원본 = `ep01-valuation-engine.md` · 음성 = `assets/audio/ep01-full.mp3`(실측 5:22).
> **가드레일:** ① 산출물(Football Field·검증 시트·결론)은 **실제 엑셀/덱 캡쳐만** — AI 재현 금지. ② **한글 텍스트는 AI 이미지에 굽지 말 것**(모델 한글 깨짐) → 깨끗한 비주얼만 생성하고 **자막·숫자 핀은 편집 단계 코드 오버레이**. ③ 얼굴 없음(Faceless).

---

## ⏱️ 타임코드 — 잠정(비례 추정)

> ⚠️ 아래 타임코드는 5:22 단일 TTS 테이크를 문단 글자수 비례로 추정한 값. **정확값은 편집 싱크 후 TODO 15에서 실측 교체.** description 챕터값도 그때 함께 갱신.

| 씬 | 내레이션 앵커(첫 줄) | 잠정 구간 | 실제 캡쳐 컷인 |
|---|---|---|---|
| S1 후킹 | "AI에게 회사 하나를 던집니다." | 0:00–0:23 | (선택) 덱 FF 정지 1컷 |
| S2 채널·페르소나 | "저는, M&A 밸류에이션과…회계사입니다." | 0:23–0:41 | — |
| S3 엔진 흐름 예고 | "엔진의 흐름은, 이렇습니다." | 0:41–1:08 | **샷③** 탭 줄 스크롤 |
| S4 데모① Football Field | "먼저, 완성된 결과물입니다." | 1:08–1:56 | **샷①+②** |
| S5 데모② Peer 출처검증(킬러) | "자, 비교기업 배수." | 1:56–2:50 | **샷④+⑤** |
| S6 데모③ WACC 출처검증 | "할인율도, 마찬가지입니다." | 2:50–3:17 | **샷⑥** |
| S7 데모④ 수렴·결론 | "이제, 네 갈래를 모읍니다." | 3:17–4:01 | **샷⑦** |
| S8 확장성(한 단계 더) | "이 구조." | 4:01–4:30 | **샷⑧** |
| S9 자동화의 끝은 사람 | "마지막으로, 하나." | 4:30–5:00 | — |
| S10 마무리·CTA | "오늘 보신, 증거우선…구조." | 5:00–5:22 | — |

캡쳐 8컷 원본 리스트: `ep01-valuation-engine.md` 하단. 추출 보관 → `youtube/assets/captures/`.

---

## 🎨 글로벌 스타일 토큰 (모든 씬 공통 — 프롬프트에 붙여 일관성 유지)

**`[STYLE]`** =
```
Cinematic faceless finance-forensic aesthetic. Dark charcoal #0E1116 / deep navy base,
a single warm amber-gold accent #E8B33D, forensic red #D64545 reserved for flags/exclusions.
Subtle film grain, soft volumetric light, shallow depth of field, slow parallax.
Motifs: audit ledger, blueprint grid, magnifier over numbers, evidence tags, paper trail,
hash/fingerprint, vault. Clean modern minimalism. NO human faces, NO readable text in image
(text added later in post). 16:9, 4K, high detail.
```

**모션 규칙:** 정지 이미지 → 편집에서 느린 줌/패럴랙스(Ken Burns) 또는 fal 비디오 모델로 4~6초 루프. 전환은 기본 **빠른 디졸브 0.3s**, 데모 진입은 **하드컷**(캡쳐로 전환 시 무게감).
**오버레이 규칙:** 한글 자막 = 하단 1/3 세이프존, Pretendard 류 산세리프. **숫자 핀** = 화면 내 해당 위치에 amber 박스 + 굵게(예: `230배`, `9.5%`). 제외/이상치 = red 취소선/태그.

---

## S1 · 후킹 (0:00–0:23)

**내레이션 비트:** 회사 던짐 → 30분 결과물 → IC 질문 2발("비교기업 왜?"/"할인율 근거?") → 답 못 하면 휴지 → "숫자 하나하나로 답하는 엔진".

**비주얼 흐름:**
1. (0:00) 회사 서류 한 장이 AI의 빛 속으로 빨려 들어가 30분 만에 "그럴듯한" 한 장이 출력되는 컷.
2. (0:08) 어두운 IC 회의실 — 빈 의자들, 한 줄기 스포트라이트가 출력물 위로. 질문이 날아드는 긴장.
3. (0:16) 그 출력물이 **구겨져 휴지통**으로 → 컷 전환되며 정밀한 "엔진" 메탈/블루프린트 이미지로 반전.

**AI 프롬프트:**
- `[STYLE] A single financial report sheet being pulled into a glowing AI core and printed out in 30 minutes, sleek but hollow, dark room, amber rim light.`
- `[STYLE] An empty investment-committee boardroom in shadow, one spotlight falling on a printed valuation page on the long table, tense, cinematic, no people.`
- `[STYLE] A crumpled valuation printout dropping into a wastebasket, then hard-cut to a precise glowing blueprint of a machine/engine made of spreadsheet cells, amber accents.`

**자막/핀(오버레이):** `AI가 30분 만에 만든 밸류에이션` → `근데, 방어가 됩니까?` / 질문 2발 채팅버블: `"이 비교기업, 왜 골랐습니까?"` `"이 할인율, 근거는요?"`
**캡쳐(선택):** 덱 Football Field 슬라이드 정지 1컷을 0:18 "엔진" 반전 직전에 플래시로 미리보기(티저)해도 좋음.
**전환 → S2:** amber 라인이 화면을 가로질러 채널 카드로 와이프.

---

## S2 · 채널·페르소나 (0:23–0:41)

**내레이션 비트:** M&A 밸류에이션·실사 회계사 → Claude Code 자동화 기록 → 공개자료(DART·웹서치) 연습 케이스, 코드명 그린플러스.

**비주얼 흐름:** 얼굴 없는 채널 카드(미니멀). 책상 위 — 회계사 상징(계산기·만년필·감사조서 바인더)이 코드/터미널 빛과 겹치는 정물. "그린플러스" 코드명은 봉인된 케이스 파일 태그로.

**AI 프롬프트:**
- `[STYLE] Minimal faceless channel card: a CPA's desk still life — fountain pen, audit binder, calculator — overlaid with faint terminal/code light, top-down, calm authority.`
- `[STYLE] A sealed case file folder stamped with a codename tag and "public data" watermark (DART/web), evidence-room mood, amber accent.`

**자막/핀:** `M&A 밸류에이션·실사 회계사` / `딜 실무 → Claude Code 자동화 기록` / `공개자료(DART·웹서치) 연습 케이스 · 코드명 GreenPlus`
**캡쳐:** 없음.
**전환 → S3:** 케이스 파일이 열리며 엑셀 탭 줄로.

---

## S3 · 엔진 흐름 예고 (0:41–1:08)

**내레이션 비트:** Assumptions → WACC → DCF·비교기업·SOTP 3갈래 → Football Field 수렴. 핵심은 사이에 낀 **WACC 출처검증·Peer 출처검증** 두 시트(대부분 모델엔 없음).

**비주얼 흐름:** 노드-플로우 다이어그램이 그려지는 모션 — `Assumptions → WACC →` 갈라지는 3갈래 `(DCF / Peer / SOTP) → Football Field`. 그 흐름선 사이로 **두 개의 검증 시트 노드가 amber로 점등**(나머지는 차분한 톤). 마지막에 실제 엑셀 탭 줄로 디졸브.

**AI 프롬프트:**
- `[STYLE] An animated node-flow diagram of a valuation pipeline: one input node branching into three valuation paths converging into a single chart node, glowing connective lines, two side "validation" nodes highlighted in amber, clean schematic, no readable text.`

**자막/핀:** 노드 라벨 오버레이 `Assumptions` `WACC` `DCF` `비교기업` `SOTP` `Football Field` / 강조 핀 `WACC 출처검증` `Peer 출처검증` ← `대부분의 모델엔 없는 시트`
**캡쳐:** **샷③** — 엑셀 탭 줄(Assumptions … Football_Field … Peer_Source_Validation) 좌우 스크롤. S3 후반(~1:00)에 컷인해 다이어그램이 "실물 탭"임을 증명.
**전환 → S4:** 탭 줄에서 Football_Field 탭이 선택되며 하드컷.

---

## S4 · 데모① Football Field (1:08–1:56)

**내레이션 비트:** 네 방법(DCF고든/DCF출구/Peer/SOTP) → 보통 보고서는 차이를 숨기고 6,650원으로 뭉갬 → 이 엔진은 차이를 나란히 펼침 → DCF·Peer는 5,800~7,000대 수렴, SOTP는 2,559까지 → SOTP는 바닥 참고용, 방어범위 5,850~7,150 → "왜 뺐는지 곧 추적".

**비주얼 흐름:** **이 구간은 실제 캡쳐가 주인공.** AI 비주얼은 도입 2~3초 브릿지(브룸: "한 줄로 뭉갠 보고서" vs "펼친 막대")만. 본문은 캡쳐 위 숫자 핀.

**AI 프롬프트(브릿지만):**
- `[STYLE] Split concept: left a single flat line hiding variance ("6,650"), right the same data exploded into four side-by-side range bars, reveal motion, amber highlight on convergence zone.`

**자막/핀:** 핀 `DCF-Gordon 4,706~7,803` `DCF-Exit 4,662~7,144` `Peer 5,723~7,595` `SOTP 2,559~5,399` / 강조 `수렴: 5,800~7,000대` / red 태그 `SOTP = 바닥 참고용` / 결론 핀 `방어 범위 5,850~7,150원`
**캡쳐:** **샷①**(덱 Football Field 슬라이드) + **샷②**(엑셀 `Football_Field` 시트) 나란히. "이 막대가 이 시트에서 나왔다" 연결. SOTP 막대에 red 강조, 수렴존 amber.
**전환 → S5:** Peer 막대 위로 줌인하며 "왜 이 회사들을?" 질문 오버레이 → Peer 시트로.

---

## S5 · 데모② Peer 출처검증 — 킬러 장면 (1:56–2:50)

**내레이션 비트:** "왜 이 회사 골랐냐"의 답 = 이 시트 한 장(티커·기준일·시총·EV·EBITDA·배수·출처URL·사용여부/사유) → 평균 안 냄 → 남선알미늄 230배=허수(이상치 제외) → 삼아 음수 EBITDA(제외) → 발몬트·린지 너무 큼(할인 참고) → 시장 8.5~15배 中 42~51%만 → 5.0~6.0배로 깎음, 사유까지 → "의견 아닌 시트로 답한다".

**비주얼 흐름:** **캡쳐 중심 + 포렌식 연출.** AI 비주얼은 "용의자 보드(증거 매핑)" 메타포 브릿지 + 행별 줌 시 돋보기/red 태그 모션 오버레이.

**AI 프롬프트(브릿지/모션):**
- `[STYLE] A forensic evidence board mapping several "peer company" cards with source-URL threads pinned, magnifier hovering, some cards stamped EXCLUDED in red, investigation mood.`
- `[STYLE] A giant outlier number looming (a multiple spiking off-chart) then being struck through with a red audit stamp, others kept; clean, dramatic 1-notch-down.`

**자막/핀:** 핀 `Namsun 230.87x → 이상치 제외` `Sam-A 음수 EBITDA → 제외` `Valmont·Lindsay 규모 過 → 할인 참고` / `시장 8.5~15배 → 적용 5.0~6.0배(42~51%만)` / 각 행 끝 `Source URL` 강조 / 라벨 `사유(rationale) 기록됨`
**캡쳐:** **샷④**(`Peer_Source_Validation` 전체 + Namsun/Sam-A 행 줌 + Source URL 열) + **샷⑤**(하단 Raw vs Applied 배수 + rationale 칸). 행별 줌인에 핀 싱크.
**전환 → S6:** "할인율도 똑같이" — 같은 검증 레이아웃을 WACC 색으로 톤 시프트.

---

## S6 · 데모③ WACC 출처검증 (2:50–3:17)

**내레이션 비트:** 무위험이자율·MRP·베타 = 제일 대충 쓰기 쉬운 숫자 → 각 입력값을 출처검증 시트에 기록 → 9.5% 출처, 베타 시점·출처 → 6개월 뒤 되짚기 가능 → "빠름이 아니라 추적 가능성이 신뢰를 만든다".

**비주얼 흐름:** 캡쳐 중심. AI 브릿지 = "대충 가져다 쓴 숫자 vs 출처 태그가 달린 숫자" 대비, 그리고 클라이맥스 카피("빠름 ≠ 신뢰 / 추적가능성 = 신뢰")용 타이포 카드.

**AI 프롬프트:**
- `[STYLE] Three input numbers (risk-free, MRP, beta) each getting a source tag and timestamp attached like evidence labels, vs the same numbers floating sourceless and faded; contrast.`
- `[STYLE] Bold minimalist typography card, dark bg amber text area left empty for Korean overlay, motif of a clock vs a fingerprint to contrast speed and traceability.`

**자막/핀:** `무위험이자율 · MRP · 베타` / 핀 `기준 할인율 9.5% — 출처 추적` `베타 = 시점·출처 기록` / 카피 오버레이 `빠름이, 신뢰를 만들지 않습니다` → `추적 가능성이, 신뢰를 만듭니다`
**캡쳐:** **샷⑥**(`WACC_Source_Validation` 입력값 출처 표).
**전환 → S7:** 검증된 입력들이 한 점으로 모이는 수렴 모션 → 결론 시트.

---

## S7 · 데모④ 수렴·결론 (3:17–4:01)

**내레이션 비트:** 네 갈래 모음 → 결론 시트의 Primary 표시(DCF2개+Peer=Primary 교차검증, SOTP 참고, LBO 제외, 각 코멘트) → 최종 지분가치 869억~1,062억, 주당 5,850~7,150 → 70%/80% 매각가 자동 환산 → 한 곳 가정 바꾸면 전체 재계산 → "경로가 끊기지 않는다".

**비주얼 흐름:** 캡쳐 중심. AI 브릿지 = 4갈래가 하나로 수렴하는 모션 + "Primary/Reference/Excluded" 분류 태그 + 마지막 "결론→가정→증거 끊김 없는 경로" 라인 애니.

**AI 프롬프트:**
- `[STYLE] Four valuation streams flowing and converging into one selected range, two tagged PRIMARY in amber, one REFERENCE, one EXCLUDED in red, clean schematic convergence.`
- `[STYLE] An unbroken glowing thread running from a conclusion node back through assumptions and evidence nodes, "no broken link", audit-trail motif.`

**자막/핀:** 핀 `Primary: DCF×2 + Peer` `Reference: SOTP` `Excluded: LBO` / `최종 지분가치 869억~1,062억원` `주당 5,850~7,150` `70%/80% 매각가 자동 환산` / 카피 `결론 → 가정 → 증거, 경로가 끊기지 않습니다`
**캡쳐:** **샷⑦**(`Valuation_Conclusion` Primary 열 + 최종 범위 행 + 70/80% 지분가).
**전환 → S8:** 단일 엔진에서 여러 엔진(실사·산업분석)으로 확장되는 펼침.

---

## S8 · 확장성 — 한 단계 더 (4:01–4:30)

**내레이션 비트:** "주장에 증거를 강제로 붙인다" 구조는 밸류에이션 전용 아님 → 실사=발견사항을 원천증거로 역추적 / 산업분석=Porter 5F 점수마다 근거 매핑 → 모든 증거 수집 시점 SHA-256 해싱("그때 그 파일") → PCAOB AS 1215 정신.

**비주얼 흐름:** 하나의 원칙(Claim→Evidence)이 3개 도메인 카드(밸류에이션/실사/산업분석)로 복제되는 모션. 해시=지문/봉인 모티프. 마지막 감사기준 도장.

**AI 프롬프트:**
- `[STYLE] One core principle icon (claim linked to evidence) cloning into three domain cards: valuation, due diligence, industry analysis (Porter 5 Forces pentagon), consistent system.`
- `[STYLE] A document being fingerprinted/sealed with a SHA-256 hash glyph, "this exact file" integrity motif, then an audit-standard stamp, forensic.`

**자막/핀:** 카드 `밸류에이션` `실사 — 발견사항 ↔ 원천증거` `산업분석 — Porter 5F 근거 매핑` / 핀 `모든 증거 = SHA-256 해싱` / `PCAOB AS 1215 — 감사 문서화 원칙`
**캡쳐:** **샷⑧**(블로그 evidence-first 화면 + Porter 5F 산출물). 짧게 플래시.
**전환 → S9:** 시스템 화면이 한 손의 결정(사람)으로 줌아웃.

---

## S9 · 자동화의 끝은 사람 (4:30–5:00)

**내레이션 비트:** 오늘 남선 자르고 SOTP 바닥으로 둔 판단 = AI 아닌 사람 결정 → AI는 초안·플래그·증거정리 → "쓰면 안 된다"는 책임은 양도 안 됨 → 경계를 분명히 할수록 자동화를 더 멀리.

**비주얼 흐름:** AI 영역(자동 생성 빛)과 사람 영역(결정의 손/체크) 사이의 **경계선** 시각화. AI는 초안 더미를 만들고, 사람 손이 최종 도장/취소선. 톤 차분·확신.

**AI 프롬프트:**
- `[STYLE] A clear boundary line: on one side an AI generating drafts and flagging anomalies (machine glow), on the other a human hand making the final decision stamp, no face, respectful balance.`
- `[STYLE] An anomaly card being flagged automatically, then a human hand striking it out with deliberate authority, "judgment not delegated", calm and resolute.`

**자막/핀:** `남선 컷 · SOTP 바닥 = 사람의 판단` / `AI: 초안 · 플래그 · 증거 정리` / `책임은 양도되지 않습니다` / `경계가 분명할수록, 자동화는 더 멀리`
**캡쳐:** 없음.
**전환 → S10:** 경계선이 채널 카드/블로그 URL로 정돈되며 마무리 톤.

---

## S10 · 마무리·CTA (5:00–5:22)

**내레이션 비트:** 증거우선 구조 더 자세히=설명란 블로그 → 구독 유도 → 다음 편 예고(공개자료만으로 IM 산업분석 Porter 5F 자동 생성) → "그럼."

**비주얼 흐름:** 미니멀 엔드카드 — 채널 카드 + 블로그 URL + 구독 프롬프트. 다음 편 티저(Porter 5F 펜타곤이 공개자료에서 자동 생성되는 0.5초 프리뷰).

**AI 프롬프트:**
- `[STYLE] Clean minimal endcard: channel card + blog URL placeholder + subscribe prompt area, calm, amber accent, lots of negative space for overlays.`
- `[STYLE] Teaser: a Porter's Five Forces pentagon auto-drawing itself from public-data fragments, next-episode hook, 16:9.`

**자막/핀:** `증거우선 밸류에이션 → 설명란 블로그` / `구독해 두세요` / 티저 `다음 편 — 공개자료만으로 IM 산업분석(Porter 5F) 자동 생성`
**캡쳐:** 없음(블로그 URL은 오버레이).
**끝.**

---

## 제작 체크리스트 (12번 진행 시)

- [ ] 글로벌 스타일 토큰으로 **키 비주얼 1장 먼저 생성 → 톤 확정** 후 나머지 일괄(일관성 핵심).
- [ ] AI 이미지엔 **한글 텍스트 굽지 않기** → 자막/핀은 편집 코드 오버레이.
- [ ] 데모 구간(S4~S8)은 **실제 캡쳐가 주인공**, AI는 브릿지/모션만. 캡쳐는 TODO 11에서 `assets/captures/`로 추출.
- [ ] 정지 이미지 → fal 비디오 모델 or Ken Burns로 4~6초 모션화(전환 디졸브 0.3s, 데모 진입 하드컷).
- [ ] 편집 싱크 후 **타임코드 실측 → 이 표 + description 챕터값 교체(TODO 15)**.
