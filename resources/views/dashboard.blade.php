<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Dashboard') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    <h3 class="text-lg font-semibold">Welkom, {{ auth()->user()->name }}!</h3>
                    <p class="mt-2">Je bent ingelogd bij Jamin.</p>
                    <p class="mt-1">Gebruikersrol: <strong>{{ auth()->user()->rolename }}</strong></p>
                    <a href="{{ route('magazijn.index') }}" class="mt-6 inline-flex rounded-lg bg-red-700 px-5 py-3 font-semibold text-white">Overzicht Magazijn Jamin</a>
                    <a href="{{ route('leveranciers.index') }}" class="mt-6 ml-3 inline-flex rounded-lg bg-gray-900 px-5 py-3 font-semibold text-white">Overzicht leveranciers</a>
                    <a href="{{ route('leveranciers.wijzigen.index') }}" class="mt-6 ml-3 inline-flex rounded-lg bg-red-700 px-5 py-3 font-semibold text-white">Wijzigen Leveranciers</a>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
