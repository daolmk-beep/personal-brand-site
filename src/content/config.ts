import { defineCollection, z } from 'astro:content';

// 글 한 편 = src/content/blog/ 안의 마크다운 파일 하나.
// 새 글 추가: 이 폴더에 .md 파일을 만들고 아래 frontmatter만 채우면 끝.
const blog = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    date: z.coerce.date(),
    tag: z.string().optional(),
    excerpt: z.string().optional(),
    draft: z.boolean().optional().default(false),
  }),
});

export const collections = { blog };
