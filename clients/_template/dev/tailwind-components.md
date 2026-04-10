# Tailwind Component Patterns — Quick Reference

Reusable Tailwind + Astro patterns for small-business sites. Reference when building client sites.

---

## Hero Section

```astro
---
// Hero.astro
interface Props {
  headline: string;
  subhead: string;
  ctaText: string;
  ctaHref: string;
  bgImage: string;
  phone: string;
}
const { headline, subhead, ctaText, ctaHref, bgImage, phone } = Astro.props;
---
<section class="relative min-h-[60vh] flex items-center justify-center text-white">
  <img src={bgImage} alt="" class="absolute inset-0 w-full h-full object-cover" />
  <div class="absolute inset-0 bg-black/50" />
  <div class="relative z-10 text-center px-4 max-w-3xl">
    <h1 class="text-3xl md:text-5xl font-extrabold leading-tight mb-4">{headline}</h1>
    <p class="text-lg md:text-xl mb-8 text-white/90">{subhead}</p>
    <div class="flex flex-col sm:flex-row gap-4 justify-center items-center">
      <a href={ctaHref} class="bg-amber-500 hover:bg-amber-600 text-white font-bold py-3 px-8 rounded-lg text-lg transition">{ctaText}</a>
      <a href={`tel:${phone}`} class="text-white font-semibold text-lg hover:underline">📞 {phone}</a>
    </div>
  </div>
</section>
```

## Service Card

```astro
---
// ServiceCard.astro
interface Props {
  title: string;
  description: string;
  icon: string;
}
const { title, description, icon } = Astro.props;
---
<div class="bg-white rounded-xl shadow-sm p-6 hover:-translate-y-1 hover:shadow-md transition">
  <div class="text-4xl mb-4">{icon}</div>
  <h3 class="text-xl font-semibold text-slate-800 mb-2">{title}</h3>
  <p class="text-slate-600 leading-relaxed">{description}</p>
</div>
```

## CTA Band

```astro
---
// CTABand.astro
interface Props {
  headline: string;
  ctaText: string;
  ctaHref: string;
  phone: string;
}
const { headline, ctaText, ctaHref, phone } = Astro.props;
---
<section class="bg-blue-800 text-white py-16">
  <div class="max-w-4xl mx-auto text-center px-4">
    <h2 class="text-2xl md:text-3xl font-bold mb-6">{headline}</h2>
    <div class="flex flex-col sm:flex-row gap-4 justify-center items-center">
      <a href={ctaHref} class="bg-amber-500 hover:bg-amber-600 text-white font-bold py-3 px-8 rounded-lg text-lg transition">{ctaText}</a>
      <a href={`tel:${phone}`} class="text-white font-semibold text-lg hover:underline">📞 {phone}</a>
    </div>
  </div>
</section>
```

## Testimonial Card

```astro
---
// Testimonial.astro
interface Props {
  quote: string;
  name: string;
  city: string;
  rating: number;
}
const { quote, name, city, rating } = Astro.props;
---
<div class="bg-white rounded-xl shadow-sm p-6">
  <div class="text-amber-500 mb-3">{'★'.repeat(rating)}{'☆'.repeat(5 - rating)}</div>
  <p class="text-slate-700 italic mb-4">"{quote}"</p>
  <p class="text-slate-500 font-medium">— {name}, {city}</p>
</div>
```

## Contact Form

```astro
---
// ContactForm.astro — use with Formspree
interface Props {
  formspreeId: string;
}
const { formspreeId } = Astro.props;
---
<form action={`https://formspree.io/f/${formspreeId}`} method="POST" class="max-w-xl mx-auto space-y-4">
  <div>
    <label for="name" class="block text-sm font-medium text-slate-700 mb-1">Name</label>
    <input type="text" id="name" name="name" required class="w-full rounded-lg border border-slate-300 px-4 py-2 focus:ring-2 focus:ring-blue-500 focus:border-transparent" />
  </div>
  <div>
    <label for="phone" class="block text-sm font-medium text-slate-700 mb-1">Phone</label>
    <input type="tel" id="phone" name="phone" class="w-full rounded-lg border border-slate-300 px-4 py-2 focus:ring-2 focus:ring-blue-500 focus:border-transparent" />
  </div>
  <div>
    <label for="email" class="block text-sm font-medium text-slate-700 mb-1">Email</label>
    <input type="email" id="email" name="email" required class="w-full rounded-lg border border-slate-300 px-4 py-2 focus:ring-2 focus:ring-blue-500 focus:border-transparent" />
  </div>
  <div>
    <label for="message" class="block text-sm font-medium text-slate-700 mb-1">Message</label>
    <textarea id="message" name="message" rows="4" class="w-full rounded-lg border border-slate-300 px-4 py-2 focus:ring-2 focus:ring-blue-500 focus:border-transparent"></textarea>
  </div>
  <button type="submit" class="w-full bg-blue-800 hover:bg-blue-900 text-white font-bold py-3 px-8 rounded-lg text-lg transition">Send Message</button>
</form>
```

## Sticky Header with Phone

```astro
---
// Header.astro
interface Props {
  businessName: string;
  phone: string;
}
const { businessName, phone } = Astro.props;
---
<header class="sticky top-0 z-50 bg-white/95 backdrop-blur shadow-sm">
  <div class="max-w-6xl mx-auto flex items-center justify-between px-4 py-3">
    <a href="/" class="text-xl font-bold text-slate-800">{businessName}</a>
    <nav class="hidden md:flex gap-6 text-slate-600 font-medium">
      <a href="/" class="hover:text-blue-800">Home</a>
      <a href="/services" class="hover:text-blue-800">Services</a>
      <a href="/contact" class="hover:text-blue-800">Contact</a>
    </nav>
    <a href={`tel:${phone}`} class="bg-blue-800 text-white font-bold py-2 px-4 rounded-lg hover:bg-blue-900 transition text-sm">{phone}</a>
  </div>
</header>
```
