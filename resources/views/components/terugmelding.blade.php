<div x-data="{ seconden: 4, timer: null }"
     x-init="timer = setInterval(() => { seconden--; if (seconden <= 0) { clearInterval(timer); window.location.assign($el.dataset.terugUrl); } }, 1000)"
     data-terug-url="{{ route('magazijn.index') }}"
     class="mb-4 text-sm text-stone-600">
    Je gaat over <span x-text="seconden">4</span> seconden terug naar het magazijn.
    <noscript><meta http-equiv="refresh" content="4;url={{ route('magazijn.index') }}"></noscript>
</div>

