// @ts-check
import { defineConfig } from 'astro/config';

// https://astro.build
// 배포: GitHub Pages (프로젝트 사이트)
//   레포   : daolmk-beep/personal-brand-site
//   URL    : https://daolmk-beep.github.io/personal-brand-site/
// → 커스텀 도메인 연결 시: site를 도메인으로 바꾸고 base 줄을 삭제.
export default defineConfig({
  site: 'https://daolmk-beep.github.io',
  base: '/personal-brand-site',
});
