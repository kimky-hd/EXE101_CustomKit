<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!-- Top Navigation -->
    <header
        class="fixed top-0 inset-x-0 z-50 w-full border-b-2 border-doodle-black bg-white/90 dark:bg-background-dark/90 backdrop-blur-sm px-6 lg:px-20 py-4">
        <div class="max-w-[1200px] mx-auto flex items-center justify-between">
            <a href="index.jsp" class="flex items-center gap-3 hover:opacity-80 transition-opacity cursor-pointer">
                <div class="bg-primary p-1 rounded-lg rotate-[-3deg] shadow-hard">
                    <span class="material-symbols-outlined text-white text-2xl">brush</span>
                </div>
                <h2 class="text-2xl font-black tracking-tighter uppercase italic">Kiss Kit</h2>
            </a>
            <nav class="hidden md:flex items-center gap-10">
                <a class="font-bold hover:text-primary transition-colors" href="#">SẢN PHẨM</a>
                <a class="font-bold hover:text-primary transition-colors" href="#">HƯỚNG DẪN</a>
                <a class="font-bold hover:text-primary transition-colors" href="#">CẢM HỨNG</a>
                <a class="font-bold hover:text-primary transition-colors" href="contact.jsp">LIÊN HỆ</a>
            </nav>
            <% com.papericious.model.Account currentUser=(com.papericious.model.Account)
                session.getAttribute("currentUser"); %>
                <div class="flex items-center gap-4">
                    <button
                        class="flex items-center justify-center p-2 rounded-lg border-2 border-doodle-black hover:bg-kraft-brown/20 transition-all">
                        <span class="material-symbols-outlined">shopping_cart</span>
                    </button>
                    <% if (currentUser==null) { %>
                        <button id="openAuthBtn"
                            class="bg-primary text-white font-black px-6 py-2 rounded-lg shadow-hard hover:translate-x-1 hover:translate-y-1 hover:shadow-none transition-all uppercase text-sm">
                            Đăng nhập
                        </button>
                        <% } else { %>
                            <div
                                class="flex items-center gap-2 border-2 border-doodle-black rounded-lg px-3 py-2 bg-white dark:bg-background-dark">
                                <span class="font-bold text-sm">
                                    <%= currentUser.getFullName() %>
                                </span>

                                <button onclick="showLogoutModal()"
                                    class="bg-primary text-white font-black px-3 py-1 rounded-lg shadow-hard transition-all text-xs uppercase hover:bg-red-700">
                                    Đăng xuất
                                </button>
                            </div>
                            <% } %>
                </div>
        </div>
    </header>

    <style>
        .hand-drawn-border {
            border: 3px solid #1b0e10;
            border-radius: 255px 15px 225px 15px/15px 225px 15px 255px;
        }
    </style>

    <!-- LOGOUT CONFIRMATION MODAL OVERLAY -->
    <div id="logoutModal"
        class="fixed inset-0 z-[60] hidden items-center justify-center bg-[#1b0e10]/60 backdrop-blur-sm p-4">
        <div
            class="relative bg-[#fcf8f9] dark:bg-[#211114] max-w-[500px] w-full p-8 md:p-12 shadow-[10px_10px_0px_0px_rgba(215,25,63,0.2)] rounded-2xl hand-drawn-border">
            <!-- Floating Doodle Hearts Decoration -->
            <div class="absolute -top-6 -left-4 text-primary text-3xl opacity-80 rotate-[-15deg] select-none">❤️</div>
            <div class="absolute top-12 -right-6 text-primary text-xl opacity-60 rotate-[20deg] select-none">❤️</div>
            <div class="absolute bottom-1/4 -left-8 text-primary text-2xl opacity-70 rotate-[10deg] select-none">❤️
            </div>

            <div class="flex flex-col items-center text-center gap-6">
                <!-- Sad Cat Mascot Illustration -->
                <div class="relative w-48 h-48 mb-2">
                    <div class="w-full h-full bg-contain bg-no-repeat bg-center"
                        style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuBIAqH2pKNwJPAU8SNrRpht7Oli1cq60L08u6uU2LcFJbd6NMNqx3v0MyjygmbIaFjIOZw8XWF02p_CT4MxPVQA1IA4vi67WFwreLJKS5P9J9DDNVP6JuXV3BF8ueI15gRuL0gxwRwkIbRIJu-m23Sm0y_-LkVCtiQZwPHHIoBO9YZTZopqA5bR0O5fZStXOqvhgXrwzBlFAMS0KvjAYzp2NNf1TgxJPpC39vRmlA-loVraFFRxaPSIyU1P8ZxGzN9Fyo7pFRPwiGI"); filter: grayscale(0.5) contrast(1.1); mix-blend-mode: multiply;'>
                    </div>
                    <!-- Overlaid Paint Tube Icon -->
                    <div class="absolute bottom-2 right-4 bg-white rounded-full p-2 shadow-sm border border-primary/20">
                        <span class="material-symbols-outlined text-primary text-2xl">format_paint</span>
                    </div>
                </div>

                <div class="flex flex-col gap-2">
                    <h1
                        class="text-3xl md:text-4xl font-extrabold tracking-tight text-[#1b0e10] dark:text-white leading-tight">
                        Rời xưởng vẽ sớm thế sao?
                    </h1>
                    <p class="text-[#974e5d] dark:text-[#f3e7ea] text-lg font-medium">
                        Bản thiết kế của bạn đang dang dở nè...
                    </p>
                </div>

                <div class="flex flex-col w-full gap-4 mt-4">
                    <!-- Primary Action -->
                    <button onclick="closeLogoutModal()"
                        class="flex h-14 w-full cursor-pointer items-center justify-center overflow-hidden rounded-xl bg-primary text-white text-lg font-extrabold shadow-[4px_4px_0px_0px_#1b0e10] hover:translate-x-[2px] hover:translate-y-[2px] hover:shadow-none transition-all active:scale-95">
                        <span class="flex items-center gap-2">
                            <span class="material-symbols-outlined">brush</span>
                            Ở lại vẽ tiếp
                        </span>
                    </button>
                    <!-- Secondary Action -->
                    <form method="post" action="<%=request.getContextPath()%>/logout" class="w-full">
                        <button type="submit"
                            class="flex h-14 w-full cursor-pointer items-center justify-center overflow-hidden rounded-xl border-2 border-[#1b0e10] dark:border-[#f3e7ea] bg-transparent text-[#1b0e10] dark:text-[#f3e7ea] text-lg font-bold hover:bg-[#1b0e10]/5 transition-colors">
                            <span>Đăng xuất</span>
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        function showLogoutModal() {
            const modal = document.getElementById('logoutModal');
            modal.classList.remove('hidden');
            modal.classList.add('flex');
        }

        function closeLogoutModal() {
            const modal = document.getElementById('logoutModal');
            modal.classList.add('hidden');
            modal.classList.remove('flex');
        }
    </script>