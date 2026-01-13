<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <jsp:include page="common/head.jsp" />
</head>
<body class="font-sans text-brand-dark antialiased">

    <jsp:include page="common/header.jsp" />

    <!-- Hero Section -->
    <section class="relative bg-brand-gray h-[500px] flex items-center justify-center overflow-hidden">
        <!-- Placeholder Image Background -->
        <img src="https://images.unsplash.com/photo-1456735190827-d1262f71b8a3?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80" alt="Hero Background" class="absolute inset-0 w-full h-full object-cover opacity-80">
        
        <div class="relative z-10 text-center bg-white/90 p-10 max-w-2xl mx-4 shadow-xl">
            <h2 class="font-serif text-4xl md:text-5xl text-brand-dark mb-4">Spring Collections</h2>
            <p class="text-gray-600 mb-8 text-lg font-light">Discover the latest paper patterns and decorative accessories for your scrapbooking projects.</p>
            <a href="#" class="inline-block bg-brand-dark text-white px-8 py-3 uppercase tracking-widest text-sm hover:bg-brand-pink transition duration-300">
                Mua Ngay
            </a>
        </div>
    </section>

    <!-- Categories Section -->
    <section class="py-16 bg-white">
        <div class="container mx-auto px-4">
            <h3 class="font-serif text-3xl text-center mb-2">Best Selling Collection</h3>
            <div class="w-16 h-1 bg-brand-pink mx-auto mb-10"></div>
            
            <div class="grid grid-cols-2 md:grid-cols-4 gap-6">
                <!-- Category Item 1 -->
                <a href="#" class="group text-center">
                    <div class="overflow-hidden rounded-full aspect-square mb-4 mx-auto w-40 border-4 border-gray-100 group-hover:border-brand-pink transition">
                        <img src="https://images.unsplash.com/photo-1586075010925-e23164a97e77?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Paper Packs" class="w-full h-full object-cover hover-zoom-img">
                    </div>
                    <h4 class="font-bold uppercase tracking-wide group-hover:text-brand-pink">Pattern Papers</h4>
                </a>
                
                <!-- Category Item 2 -->
                <a href="#" class="group text-center">
                    <div class="overflow-hidden rounded-full aspect-square mb-4 mx-auto w-40 border-4 border-gray-100 group-hover:border-brand-pink transition">
                        <img src="https://images.unsplash.com/photo-1605117882932-f9e32b03ef3c?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Chippies" class="w-full h-full object-cover hover-zoom-img">
                    </div>
                    <h4 class="font-bold uppercase tracking-wide group-hover:text-brand-pink">Chipboards</h4>
                </a>

                <!-- Category Item 3 -->
                <a href="#" class="group text-center">
                    <div class="overflow-hidden rounded-full aspect-square mb-4 mx-auto w-40 border-4 border-gray-100 group-hover:border-brand-pink transition">
                        <img src="https://images.unsplash.com/photo-1516975080664-ed2fc6a32937?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Stamps" class="w-full h-full object-cover hover-zoom-img">
                    </div>
                    <h4 class="font-bold uppercase tracking-wide group-hover:text-brand-pink">Stamps & Dies</h4>
                </a>

                <!-- Category Item 4 -->
                <a href="#" class="group text-center">
                    <div class="overflow-hidden rounded-full aspect-square mb-4 mx-auto w-40 border-4 border-gray-100 group-hover:border-brand-pink transition">
                        <img src="https://images.unsplash.com/photo-1513519245088-0e12902e5a38?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80" alt="Decor" class="w-full h-full object-cover hover-zoom-img">
                    </div>
                    <h4 class="font-bold uppercase tracking-wide group-hover:text-brand-pink">Home Decor</h4>
                </a>
            </div>
        </div>
    </section>

    <!-- New Arrivals Product Grid -->
    <section class="py-16 bg-brand-gray/30">
        <div class="container mx-auto px-4">
            <h3 class="font-serif text-3xl text-center mb-2">New Products</h3>
            <div class="w-16 h-1 bg-brand-pink mx-auto mb-10"></div>

            <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-4 gap-8">
                <!-- Product 1 -->
                <div class="group bg-white p-4 shadow-sm hover:shadow-xl transition duration-300">
                    <div class="relative overflow-hidden aspect-[3/4] mb-4 bg-gray-100">
                        <img src="https://placehold.co/400x533/e8a6ae/white?text=Paper+Pack+12x12" alt="Product" class="w-full h-full object-cover hover-zoom-img">
                        <div class="absolute bottom-0 left-0 right-0 bg-white/90 py-3 translate-y-full group-hover:translate-y-0 transition duration-300 flex justify-center gap-4">
                            <button class="text-brand-dark hover:text-brand-pink"><i class="far fa-heart"></i></button>
                            <button class="text-brand-dark hover:text-brand-pink"><i class="fas fa-shopping-cart"></i></button>
                            <button class="text-brand-dark hover:text-brand-pink"><i class="far fa-eye"></i></button>
                        </div>
                    </div>
                    <div class="text-center">
                        <p class="text-xs text-gray-500 mb-1">PAPER PACKS</p>
                        <h4 class="font-bold text-gray-800 mb-2 hover:text-brand-pink cursor-pointer">Wedding Bliss Collection</h4>
                        <span class="text-brand-pink font-bold">185.000₫</span>
                    </div>
                </div>

                <!-- Product 2 -->
                <div class="group bg-white p-4 shadow-sm hover:shadow-xl transition duration-300">
                    <div class="relative overflow-hidden aspect-[3/4] mb-4 bg-gray-100">
                        <img src="https://placehold.co/400x533/d4af37/white?text=Laser+Cut+Chipboard" alt="Product" class="w-full h-full object-cover hover-zoom-img">
                        <div class="absolute bottom-0 left-0 right-0 bg-white/90 py-3 translate-y-full group-hover:translate-y-0 transition duration-300 flex justify-center gap-4">
                            <button class="text-brand-dark hover:text-brand-pink"><i class="far fa-heart"></i></button>
                            <button class="text-brand-dark hover:text-brand-pink"><i class="fas fa-shopping-cart"></i></button>
                            <button class="text-brand-dark hover:text-brand-pink"><i class="far fa-eye"></i></button>
                        </div>
                    </div>
                    <div class="text-center">
                        <p class="text-xs text-gray-500 mb-1">CHIPPIES</p>
                        <h4 class="font-bold text-gray-800 mb-2 hover:text-brand-pink cursor-pointer">Floral Frame Design</h4>
                        <span class="text-brand-pink font-bold">45.000₫</span>
                    </div>
                </div>

                <!-- Product 3 -->
                <div class="group bg-white p-4 shadow-sm hover:shadow-xl transition duration-300">
                    <div class="relative overflow-hidden aspect-[3/4] mb-4 bg-gray-100">
                        <img src="https://placehold.co/400x533/ccc/white?text=Decoupage+Paper" alt="Product" class="w-full h-full object-cover hover-zoom-img">
                         <div class="absolute top-2 left-2 bg-brand-dark text-white text-xs px-2 py-1">NEW</div>
                        <div class="absolute bottom-0 left-0 right-0 bg-white/90 py-3 translate-y-full group-hover:translate-y-0 transition duration-300 flex justify-center gap-4">
                            <button class="text-brand-dark hover:text-brand-pink"><i class="far fa-heart"></i></button>
                            <button class="text-brand-dark hover:text-brand-pink"><i class="fas fa-shopping-cart"></i></button>
                            <button class="text-brand-dark hover:text-brand-pink"><i class="far fa-eye"></i></button>
                        </div>
                    </div>
                    <div class="text-center">
                        <p class="text-xs text-gray-500 mb-1">DECOUPAGE</p>
                        <h4 class="font-bold text-gray-800 mb-2 hover:text-brand-pink cursor-pointer">Vintage Roses A3</h4>
                        <span class="text-brand-pink font-bold">35.000₫</span>
                    </div>
                </div>

                <!-- Product 4 -->
                <div class="group bg-white p-4 shadow-sm hover:shadow-xl transition duration-300">
                    <div class="relative overflow-hidden aspect-[3/4] mb-4 bg-gray-100">
                        <img src="https://placehold.co/400x533/888/white?text=Clear+Stamp" alt="Product" class="w-full h-full object-cover hover-zoom-img">
                        <div class="absolute bottom-0 left-0 right-0 bg-white/90 py-3 translate-y-full group-hover:translate-y-0 transition duration-300 flex justify-center gap-4">
                            <button class="text-brand-dark hover:text-brand-pink"><i class="far fa-heart"></i></button>
                            <button class="text-brand-dark hover:text-brand-pink"><i class="fas fa-shopping-cart"></i></button>
                            <button class="text-brand-dark hover:text-brand-pink"><i class="far fa-eye"></i></button>
                        </div>
                    </div>
                    <div class="text-center">
                        <p class="text-xs text-gray-500 mb-1">STAMPS</p>
                        <h4 class="font-bold text-gray-800 mb-2 hover:text-brand-pink cursor-pointer">Journal Quotes</h4>
                        <span class="text-brand-pink font-bold">120.000₫</span>
                    </div>
                </div>
            </div>
            
            <div class="text-center mt-12">
                <a href="#" class="inline-block border-2 border-brand-dark text-brand-dark px-10 py-3 hover:bg-brand-dark hover:text-white transition uppercase tracking-widest text-sm font-bold">
                    View All
                </a>
            </div>
        </div>
    </section>

    <jsp:include page="common/footer.jsp" />

</body>
</html>
