# EP01 — 음성 보이스 비교 테스트 (ElevenLabs)

> 목적: 풀 에피소드 생성 전, **한국어 중저음·권위형 보이스 + 세팅**을 확정. 짧은 컷 3종으로 톤 범위를 검증.
> 출력: `youtube/assets/audio/test/` (mp3, git 제외). 비용: 3컷 × 2~3보이스 ≈ 수백 자 → 무료 티어 무시 가능.

## 세팅 (모든 테스트 공통)
- 모델: `eleven_multilingual_v2` (안정) — 가능하면 v3도 1컷 비교
- stability **0.55~0.65** / similarity **0.75** / speed **1.0** (범위 0.7~1.2)
- 보이스 후보: ElevenLabs Voice Library에서 **한국어 남성·중저음·내레이션** 검색 → voice_id 2~3개 확보 후 동일 컷으로 A/B

## 테스트 컷 (3종 — 톤 범위 검증용)

**컷 1 — 후킹(수사의문→단정, 권위):**
AI에게 회사 하나를 던집니다.
30분 만에, 밸류에이션 한 장이 나옵니다.
보기엔, 그럴듯하죠.
그런데 답을 못 하면…그 결과물은 휴지가 됩니다.

**컷 2 — 숫자 핀(단정·하강):**
남선알미늄.
EV 대 EBITDA가…이백삼십 배입니다.
분모가 거의 영에 수렴해서 생긴 허수죠.
…이상치, 중앙값에서 제외.

**컷 3 — 결론(확신, 톤 내려 단정):**
빠름이, 신뢰를 만들지 않습니다.
…추적 가능성이, 신뢰를 만듭니다.

## 평가 기준
1. 권위·신뢰감(경제명탐정 톤) 2. 또박또박 명료도(숫자·영문 고유명사) 3. `…`/줄바꿈 pause가 자연스러운가 4. 한국어 발음 부자연스러운 구간 없는가

## 확정 후
- voice_id + 모델 + 세팅을 이 파일 하단에 기록 → 풀 에피소드(`ep01-narration-clean.md`) 생성에 그대로 사용.

### 확정값 (2026-06-26 확정)
- voice: **Chris - Charming, Down-to-Earth** (ElevenLabs 프리메이드)
- voice_id: `iP95p4xoKVk53GoZ742B`
- model: `eleven_multilingual_v2`
- language: `ko`
- settings: stability `0.30` / similarity `0.75` / speed `1.15` / style `0.45` / speaker_boost `on`
- 테스트 산출물: `youtube/assets/audio/test/cut1~3_chris.mp3` (3컷 톤 일관성 확인 완료)

> **제약 메모(중요):** ElevenLabs **무료 티어 API는 프리메이드 보이스만** 사용 가능. 한국어 네이티브 라이브러리 보이스(Midnight Cave·Eun-joong·Min 등)와 Voice Design은 **유료 전용**(`paid_plan_required`)이라 무료로는 불가. → Chris는 영어권 프리메이드가 multilingual_v2로 한국어를 읽는 것이라 약한 외국 억양 잔존. 네이티브 품질이 필요하면 Starter 업그레이드 후 라이브러리 보이스로 재확정할 것.
