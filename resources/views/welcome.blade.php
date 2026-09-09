<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Jamin | Backend leerjaar 2</title>
    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>
<body class="bg-gray-100 text-gray-900 antialiased">
    <main class="min-h-screen flex items-center justify-center p-6">
        <section class="w-full max-w-2xl rounded-2xl bg-white p-8 sm:p-12 shadow-sm border border-gray-200">
            <p class="text-sm font-semibold uppercase tracking-widest text-indigo-600">Backend · Leerjaar 2</p>
            <h1 class="mt-4 text-4xl font-bold">Welkom bij Jamin</h1>
            <p class="mt-5 text-lg leading-relaxed text-gray-600">Je project begint hier. Maak een account aan of log in om naar je dashboard te gaan.</p>
            <nav class="mt-8 flex flex-wrap gap-4" aria-label="Account">
                @auth
                    <a href="{{ route('dashboard') }}" class="rounded-lg bg-indigo-600 px-6 py-3 font-semibold text-white hover:bg-indigo-700">Naar dashboard</a>
                @else
                    <a href="{{ route('register') }}" class="rounded-lg bg-indigo-600 px-6 py-3 font-semibold text-white hover:bg-indigo-700">Registreren</a>
                    <a href="{{ route('login') }}" class="rounded-lg border border-gray-300 px-6 py-3 font-semibold hover:bg-gray-50">Inloggen</a>
                @endauth
            </nav>
        </section>
    </main>
</body>
</html>
