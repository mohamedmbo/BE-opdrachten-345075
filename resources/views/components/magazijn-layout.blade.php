@props(['title'])
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ $title }} | Jamin</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>
<body class="magazijn-app">
    <a href="#inhoud" class="skip-link">Naar inhoud</a>
    <header class="magazijn-header">
        <a class="jamin-merk" href="{{ route('magazijn.index') }}">jamin<span>Magazijn</span></a>
        <nav aria-label="Hoofdnavigatie">
            <a href="{{ route('magazijn.index') }}">Producten</a>
            <a href="{{ route('dashboard') }}">Mijn account</a>
            <form method="POST" action="{{ route('logout') }}">@csrf<button type="submit">Uitloggen</button></form>
        </nav>
    </header>
    <main id="inhoud" class="magazijn-main">
        <p class="eyebrow">Jamin · Voorraad &amp; productinformatie</p>
        <h1>{{ $title }}</h1>
        {{ $slot }}
    </main>
    <footer class="magazijn-footer">Jamin magazijn · Ingelogd als {{ auth()->user()->name }}</footer>
</body>
</html>

