<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Top Bar -->
<div class="bg-brand-pink text-white text-xs py-2 text-center tracking-wide">
    FREE SHIPPING ON ORDERS OVER 500,000 VND | SUBSCRIBE FOR OFFERS
</div>

<!-- Header -->
<header class="bg-white shadow-sm sticky top-0 z-50">
    <div class="container mx-auto px-4 py-4">
        <div class="flex flex-col md:flex-row items-center justify-between gap-4">

            <!-- Search (Hidden on mobile initially for simplicity) -->
            <div class="hidden md:flex items-center w-1/3">
                <div class="relative w-full max-w-xs">
                    <input type="text" placeholder="Search products..." class="w-full border border-gray-300 rounded-full py-2 px-4 focus:outline-none focus:border-brand-pink text-sm">
                    <button class="absolute right-3 top-2.5 text-gray-400 hover:text-brand-pink">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </div>

            <!-- Logo -->
            <div class="w-full md:w-1/3 text-center">
                <a href="#" class="font-serif text-3xl font-bold tracking-widest hover:text-brand-pink transition">
                    PAPERICIOUS
                </a>
                <p class="text-xs text-gray-500 tracking-widest mt-1">HANDCRAFTED WITH LOVE</p>
            </div>

            <!-- Icons -->
            <div class="flex items-center justify-end w-full md:w-1/3 gap-6">
                <a href="#" class="text-gray-600 hover:text-brand-pink flex flex-col items-center text-xs">
                    <i class="far fa-user text-lg mb-1"></i>
                    <span>Account</span>
                </a>
                <a href="#" class="text-gray-600 hover:text-brand-pink flex flex-col items-center text-xs relative">
                    <i class="far fa-heart text-lg mb-1"></i>
                    <span>Wishlist</span>
                </a>
                <a href="#" class="text-gray-600 hover:text-brand-pink flex flex-col items-center text-xs relative">
                    <i class="fas fa-shopping-bag text-lg mb-1"></i>
                    <span>Cart (0)</span>
                </a>
            </div>
        </div>
    </div>

    <!-- Navigation -->
    <nav class="border-t border-gray-100 hidden md:block">
        <div class="container mx-auto px-4">
            <ul class="flex justify-center gap-8 py-3 text-sm font-bold uppercase tracking-wide text-gray-700">
                <li><a href="#" class="hover:text-brand-pink transition">Home</a></li>
                <li><a href="#" class="hover:text-brand-pink transition">Pattern Papers</a></li>
                <li><a href="#" class="hover:text-brand-pink transition">Chippies</a></li>
                <li><a href="#" class="hover:text-brand-pink transition">Stamps</a></li>
                <li><a href="#" class="hover:text-brand-pink transition">Decoupage</a></li>
                <li><a href="#" class="hover:text-brand-pink transition">Paints & Inks</a></li>
                <li><a href="#" class="hover:text-brand-pink transition text-red-500">Sale</a></li>
            </ul>
        </div>
    </nav>
</header>
