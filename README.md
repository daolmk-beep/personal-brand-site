# LedgerLab — 개인 브랜드 사이트

현직 CPA의 실사·감사 자동화 인사이트 블로그. Astro 정적 사이트.

## 로컬 실행

```bash
npm install      # 최초 1회
npm run dev      # http://localhost:4321 미리보기 (저장 시 자동 새로고침)
npm run build    # dist/ 에 정적 빌드
npm run preview  # 빌드 결과 미리보기
```

## 새 글 쓰기

`src/content/blog/` 에 마크다운 파일(`my-post.md`)을 만들고 frontmatter만 채우면
홈/블로그 목록과 상세 페이지가 자동 생성된다. 파일명이 곧 URL(slug)이 된다.

```markdown
---
title: "글 제목"
date: 2026-07-01
tag: "방법론"          # 선택
excerpt: "한 줄 요약"   # 선택, 목록에 노출
draft: false           # true면 빌드에서 제외
---

본문 (마크다운)
```

## 바꿔야 할 플레이스홀더

| 위치 | 내용 |
|------|------|
| `src/layouts/Base.astro` | 브랜드명 `LedgerLab`, 필명 `M.K.`, 푸터 |
| `src/pages/index.astro` | 히어로 문구, `mailto:[[EMAIL]]` |
| `astro.config.mjs` | 배포 도메인(`site`), GitHub Pages면 `base` |
| `public/favicon.svg` | 파비콘 |

## 배포

- **Vercel / Netlify**: 저장소 연결 → 프레임워크 Astro 자동 인식 → 끝. `astro.config.mjs`의 `site`만 도메인으로.
- **GitHub Pages**: `site`(`https://USERNAME.github.io`) + `base`(`/REPO`) 설정 후 Actions로 배포.

## 참고

이 폴더는 DD-Audit 감사 저장소와 **분리된 별도 프로젝트**다.
사이트에는 실제 고객·딜 정보를 절대 게재하지 않는다(모든 사례 익명화·일반화).
