# EP01 AI 비주얼 — 벡터/타이포 씬 (무료 파이프라인)

> **경로:** fal(유료/결제 막힘) 대신 **이 PC의 헤드리스 Chrome으로 HTML→PNG 렌더** = 무료·GPU 불필요·한글 정확·무한 재생성.
> **근거:** TODO 12 비주얼 시트(`youtube/scripts/ep01-visual-prompts.md`) S1~S10 + 글로벌 `[STYLE]` 토큰을 그대로 코드화.

## 산출물 (1920×1080 PNG)

| 파일 | 씬 | 내용 |
|---|---|---|
| `s01.png` | S1 후킹 | "AI 30분 밸류에이션 — 방어가 됩니까?" + IC 질문 칩 |
| `s02.png` | S2 페르소나 | M&A 밸류에이션·실사 회계사 / 공개자료·GreenPlus |
| `s03.png` | S3 엔진 흐름 | 노드플로우(Assumptions→WACC→DCF/Peer/SOTP→Football Field) + 출처검증 2시트 강조 |
| `s04.png` | S4 결과물 | "숨긴다 6,650원" vs "나란히 펼친다" 대비 (실제 캡쳐 브릿지) |
| `s05.png` | S5 킬러 | Peer 출처검증 — 남선230배·삼아 제외·발몬트/린지 할인 + 5.0~6.0배 |
| `s06.png` | S6 WACC | "빠름이 아니라 추적 가능성이 신뢰를 만든다" 타이포 |
| `s07.png` | S7 수렴 | Primary/Reference/Excluded → 최종 869~1,062억 / 5,850~7,150원 |
| `s08.png` | S8 확장성 | Claim→Evidence → 밸류에이션·실사·산업분석 + SHA-256·PCAOB |
| `s09.png` | S9 경계 | AI(초안·플래그) vs 사람(판단) — "책임은 양도되지 않습니다" |
| `s10.png` | S10 엔드카드 | 구독 + 블로그 + EP02 예고(Porter 5F) |

`s1_hook_card_SAMPLE.png` = 최초 톤 검증본(참고, 폐기 가능).

## 재렌더 / 수정 방법

소스 = `build/*.html` (+ 공유 `build/style.css` = `[STYLE]` 팔레트·컴포넌트).
```powershell
# 전체 재렌더
powershell -File youtube/assets/visuals/build/render.ps1
# 특정 씬만
powershell -File youtube/assets/visuals/build/render.ps1 s03 s07
```
- 문구·색·레이아웃은 해당 `sNN.html` 또는 `style.css`만 고치면 됨. 텍스트가 코드라 **숫자·자막 수정이 즉시·무한 무료**.
- 렌더러: Chrome 헤드리스(없으면 Edge 폴백). 씬마다 임시 프로필 분리(단일 인스턴스 attach 방지).

## 편집 단계에서 할 일 (사람)

1. 정지 PNG → **CapCut/DaVinci Resolve(무료)** 로 느린 줌·패럴랙스(Ken Burns) + 전환(디졸브 0.3s, 데모 진입 하드컷).
2. 데모 구간(S4~S8)은 `assets/captures/`의 **실제 엑셀·덱 캡쳐가 주인공** — 위 카드는 도입 브릿지.
3. 주변 b-roll(사무실/추상 금융): **Pexels·Pixabay·Mixkit**(무료 스톡).
4. 음성 `assets/audio/ep01-full.mp3`(5:22)에 싱크.

## 미제작(옵션, 요청 시 추가)

- **자막(lower-third)·숫자핀 오버레이 템플릿** — `style.css`에 `.lower3`/`.pin` 클래스 준비됨. 투명 PNG 일괄 생성 가능(요청 시).
- 포토리얼 히어로 컷(IC 회의실 등) 원하면 Ideogram 웹/Bing 무료로 `[STYLE]` 프롬프트(비주얼 시트) 사용.
