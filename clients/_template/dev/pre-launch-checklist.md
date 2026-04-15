# Pre-Launch Checklist

Run through this before requesting final owner approval for any client site.

---

## Build & Performance
- [ ] `npm run build` completes without errors or warnings
- [ ] Lighthouse score: Performance > 90, Accessibility > 95, Best Practices > 90, SEO > 90
- [ ] All images optimized (WebP/AVIF, lazy-loaded below the fold)
- [ ] No unused CSS/JS in production bundle
- [ ] Fonts preloaded, `font-display: swap` set

## Content & Copy
- [ ] All placeholder text replaced with final copy from `content/` folder
- [ ] Phone numbers use `tel:` links, emails use `mailto:`
- [ ] Business name, address, phone consistent across all pages
- [ ] No lorem ipsum, no broken image placeholders

## Forms & Functionality
- [ ] Contact form submits successfully (test with real email)
- [ ] Formspree/Turnstile configured with client's email
- [ ] Form shows success/error states
- [ ] All nav links work (no 404s)
- [ ] External links open in new tab

## Mobile & Responsive
- [ ] Tested at 320px, 375px, 768px, 1024px, 1280px
- [ ] Tap targets >= 44x44px
- [ ] No horizontal scroll on any viewport
- [ ] Mobile nav hamburger opens/closes correctly

## SEO & Analytics
- [ ] Page titles and meta descriptions set per page
- [ ] Open Graph tags (title, description, image) for social sharing
- [ ] `robots.txt` and `sitemap.xml` generated
- [ ] Google Analytics or Cloudflare Analytics snippet installed
- [ ] Canonical URLs set

## Domain & Hosting
- [ ] Custom domain configured in Cloudflare Pages
- [ ] SSL certificate active (HTTPS forced)
- [ ] DNS propagation verified
- [ ] Old site redirect plan (if replacing existing site)
- [ ] 404 page styled and helpful

## Final
- [ ] Owner has reviewed on their phone and desktop
- [ ] Google Business Profile updated with new website URL
- [ ] "Website by Hands Off Design" footer link present and correct
