# EP01 캡쳐 인덱스 (실제 산출물 스크린샷)

> **추출일:** 2026-06-26 · **원본:** GreenPlus 밸류에이션 모델(엑셀) + IC 메모 덱(PPTX)
> **방식:** 엑셀 = 시트별 PDF(읽기전용, 원본 무수정) → pdftoppm 200DPI PNG / 덱 = PowerPoint COM PNG export(2560×1440)
> **출처 파일:**
> - 엑셀: `IB-Investment-House/.../03_Valuation-Model/Valuation_ProjectGreenPlus_v6_consistency_locked_ex_LBO_20260519.xlsx`
> - 덱: `.../07_IC-Memo/IC_GreenPlus_Final.pptx` (32슬라이드)
> **가드레일:** GreenPlus = 공개자료(DART·웹서치) 연습 케이스 → NDA 무관, 산출물 노출 OK. 단 덱 푸터 `IC Internal Memo | CONFIDENTIAL`은 **연습 케이스 템플릿 보일러플레이트** → 영상에선 하단 푸터 크롭/정리 권장(내용 비밀 아님, 외관 정리 차원).

---

## 🎬 샷리스트 8컷 ↔ 파일 매핑 (비주얼 시트 S씬 연동)

| 샷 | 비주얼 씬 | 파일 | 비고 |
|---|---|---|---|
| ① 덱 Football Field | S4 | **`deck_p27_football_field.png`** ★히어로 | 막대그래프(DCF·Peer·SOTP·최종범위). ⚠️**슬라이드 27** (요청은 30이었으나 30=리스크맵, 실제 FF는 27) |
| ② 엑셀 Football_Field | S4 | **`xl_Football_Field-1.png`** | 4방법 범위 표 + Selected Defensible Range + 70/80% 지분가 |
| ③ 엑셀 탭 줄 스크롤 | S3 | (별도 — 아래 "미추출" 참조) | 시트 탭 바 = UI 요소, 자동 export 불가 → 윈도우 스크린샷 필요 |
| ④ Peer 출처검증(전체+행 줌+URL) | S5 ★킬러 | **`xl_Peer_Source_Validation-1.png`** | 티커·기준일·EV·EBITDA·배수·Source URL·사용여부/사유 14열 한 장 |
| ⑤ Peer Raw vs Applied + rationale | S5 | `xl_Peer_Source_Validation-1.png`(동일 시트 하단) | 같은 PNG 하단 크롭 |
| ⑥ WACC 출처검증 | S6 | **`xl_WACC_Source_Validation-1.png`** | 입력값(무위험·MRP·베타) 출처 표 |
| ⑦ Valuation_Conclusion | S7 | **`xl_Valuation_Conclusion-1.png`** (+`-2` 하단) | Primary 열 + 최종 범위 + 70/80% |
| ⑧ 블로그+Porter 5F | S8 | (별도 — 블로그 화면 캡쳐 / Porter는 EP02 자산) | 본 저장소 `evidence-first` 블로그 화면 캡쳐로 대체 |

**추가 확보(보너스, 컷인 옵션):**
- `deck_p25_dcf.png` / `deck_p26_peer_sotp.png` / `deck_p28_valuation_conclusion.png` — 덱의 DCF·Peer/SOTP·종합결론 슬라이드. S5~S7 폴리시드 컷인 대안.
- `xl_DCF-*.png`, `xl_WACC-*.png`, `xl_SOTP-1.png`, `xl_Peer_Multiples-*.png`, `xl_Assumptions-*.png`, `xl_Peer_Upside_Case-*.png` — 흐름/맥락 컷용.
- (`-2` 접미사 = 폭 1페이지 맞춤 후 세로 넘침 페이지. 대개 하단 몇 행.)

**미추출(수작업 필요):**
- **샷③ 탭 줄:** 엑셀 하단 시트 탭 바 = 앱 UI라 파일 export 불가. → 엑셀 창 띄워 탭 영역 윈도우 스크린샷 1장. (또는 S3는 비주얼 시트의 노드-플로우 AI 다이어그램으로 대체 가능 — 탭 실물 증명만 짧게.)
- **샷⑧ Porter 5F 산출물:** EP02 자산(아직 없음). S8은 블로그 evidence-first 화면 + (있으면) 기존 Porter 산출물로. 없으면 개념 카드 AI 비주얼로 대체.
- **LBO 시트:** export 실패(모델에서 제외된 시트, `ex_LBO`). 영상에서 LBO=Excluded라 불필요.

---

## ⚠️ 중요 — 덱 vs 엑셀 숫자 불일치 (편집 시 필수 확인)

내레이션은 **엑셀 모델 숫자** 기준으로 작성됨. 덱 슬라이드 27은 **방법별 세부 범위가 다르게(라운딩/갱신) 표시**됨. 최종 방어범위·지분가치는 일치하나 세부가 어긋남:

| 항목 | 내레이션/엑셀 | 덱 p27 | 비고 |
|---|---|---|---|
| **최종 범위** | 5,850~7,150원 | 5,850~7,150원 | ✅ 일치 |
| **Equity Value** | 869억~1,062억 (86,931~106,249) | 86,931~106,249 | ✅ 일치 |
| DCF-Gordon | 4,706~7,803 | 4,775~7,025 | ✖ 상이 |
| DCF-Exit | 4,662~7,144 | 4,600~6,900 | ✖ 상이 |
| Peer | 5,723~7,595 | 5,500~8,200 | ✖ 상이 |
| **SOTP 하단** | **2,559** (내레이션 "이천오백오십구") | **3,200**(범위)/3,816(mid) | ✖ **음성과 화면 충돌 위험** |

**→ 결정(2026-06-26): 불일치 패스 — 데모 시연 목적이므로 덱·엑셀 세부 숫자 차이는 통제하지 않고 그대로 사용.** 덱 p27(예쁜 막대)과 엑셀 시트 둘 다 자유롭게 컷인. 최종 범위·Equity는 어차피 일치.
(참고용 원안: 정밀 싱크가 필요하면 엑셀 `xl_Football_Field-1.png`를 number-of-record로 쓰거나 덱 p27을 엑셀 값으로 갱신 후 재캡쳐 — 이번 편에선 미적용.)
