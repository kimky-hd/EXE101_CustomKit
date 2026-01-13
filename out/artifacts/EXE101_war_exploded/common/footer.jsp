<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Instagram/Newsletter Section -->
<section class="py-20 bg-brand-pink/10">
    <div class="container mx-auto px-4 text-center max-w-2xl">
        <h3 class="font-serif text-3xl mb-4">Newsletter Subscription</h3>
        <p class="text-gray-600 mb-8">Be the first to know about new collections, craft tutorials, and exclusive offers.</p>
        <form class="flex flex-col md:flex-row gap-4">
            <input type="email" placeholder="Your email address" class="flex-1 px-4 py-3 border border-gray-300 focus:outline-none focus:border-brand-pink">
            <button type="button" class="bg-brand-dark text-white px-8 py-3 uppercase tracking-widest text-sm font-bold hover:bg-brand-pink transition">
                Subscribe
            </button>
        </form>
    </div>
</section>

<!-- Footer -->
<footer class="bg-brand-dark text-white pt-16 pb-8">
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8 mb-12">
            <!-- About -->
            <div>
                <h5 class="font-serif text-xl mb-6">Papericious</h5>
                <p class="text-gray-400 text-sm leading-relaxed mb-6">
                    Specializing in high-quality craft supplies, from pattern papers and chipboards to decorative tools. Igniting your creative inspiration.
                </p>
                <div class="flex gap-4">
                    <a href="#" class="w-8 h-8 rounded-full bg-white/10 flex items-center justify-center hover:bg-brand-pink transition"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="w-8 h-8 rounded-full bg-white/10 flex items-center justify-center hover:bg-brand-pink transition"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="w-8 h-8 rounded-full bg-white/10 flex items-center justify-center hover:bg-brand-pink transition"><i class="fab fa-youtube"></i></a>
                </div>
            </div>

            <!-- Links -->
            <div>
                <h5 class="font-bold text-sm uppercase tracking-widest mb-6">Information</h5>
                <ul class="text-gray-400 text-sm space-y-3">
                    <li><a href="#" class="hover:text-brand-pink transition">About Us</a></li>
                    <li><a href="#" class="hover:text-brand-pink transition">Contact Us</a></li>
                    <li><a href="#" class="hover:text-brand-pink transition">Terms of Service</a></li>
                    <li><a href="#" class="hover:text-brand-pink transition">Privacy Policy</a></li>
                    <li><a href="#" class="hover:text-brand-pink transition">Creative Blog</a></li>
                </ul>
            </div>

            <!-- Shop -->
            <div>
                <h5 class="font-bold text-sm uppercase tracking-widest mb-6">Shop</h5>
                <ul class="text-gray-400 text-sm space-y-3">
                    <li><a href="#" class="hover:text-brand-pink transition">New Arrivals</a></li>
                    <li><a href="#" class="hover:text-brand-pink transition">Best Sellers</a></li>
                    <li><a href="#" class="hover:text-brand-pink transition">Promotions</a></li>
                    <li><a href="#" class="hover:text-brand-pink transition">Order Tracking</a></li>
                </ul>
            </div>

            <!-- Contact -->
            <div>
                <h5 class="font-bold text-sm uppercase tracking-widest mb-6">Contact</h5>
                <ul class="text-gray-400 text-sm space-y-4">
                    <li class="flex gap-3">
                        <i class="fas fa-map-marker-alt mt-1 text-brand-pink"></i>
                        <span>123 Creative Street, District 1,<br>Ho Chi Minh City</span>
                    </li>
                    <li class="flex gap-3">
                        <i class="fas fa-phone-alt mt-1 text-brand-pink"></i>
                        <span>+84 123 456 789</span>
                    </li>
                    <li class="flex gap-3">
                        <i class="fas fa-envelope mt-1 text-brand-pink"></i>
                        <span>hello@papericious.com</span>
                    </li>
                </ul>
            </div>
        </div>

        <div class="border-t border-white/10 pt-8 text-center text-gray-500 text-xs">
            <p>&copy; 2024 Papericious Clone. All rights reserved. Designed for Demo.</p>
        </div>
    </div>
</footer>
