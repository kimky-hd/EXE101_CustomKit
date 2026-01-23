<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <div id="authOverlay" class="fixed inset-0 z-40 bg-black/50 backdrop-blur-sm hidden"></div>
        <div id="authModal" class="fixed inset-0 z-50 hidden items-center justify-center px-4">
            <div
                class="relative w-full max-w-[900px] bg-kraft-brown dark:bg-[#2a2a2a] rounded-lg shadow-2xl overflow-hidden flex flex-col md:flex-row border-[6px] border-doodle-black paper-texture">
                <div class="absolute -top-4 -left-4 z-20 text-primary select-none pointer-events-none">
                    <span class="material-symbols-outlined text-6xl">favorite</span>
                </div>
                <div class="absolute -bottom-4 -right-4 z-20 text-primary rotate-12 select-none pointer-events-none">
                    <span class="material-symbols-outlined text-6xl">favorite</span>
                </div>
                <div
                    class="w-full md:w-1/2 bg-[#f3e7ea] dark:bg-[#332225] p-12 flex flex-col items-center justify-center relative border-b-4 md:border-b-0 md:border-r-4 border-doodle-black">
                    <div class="relative w-full max-w-[280px] aspect-square flex items-center justify-center">
                        <div class="w-full h-full bg-contain bg-no-repeat bg-center"
                            style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuCFkkKM0YHx0Oxl_F8Neojd0xX6ZpSoVHa7WbsQi5amxR8XyueRgqv8AbsJyPPzAGQ1kknMGpHqqUDL_uhCN8RFiXzscqcEQxlTWwr6AeDEFY7mKoT39hCXjc-H51IoqGvHkkjtCqCGxCJGRekQwFJ6TKCKWGU09XS1eQn1QXnlpzR0lHaKs1fqkC5verP7msaGKBZZf9FzEAPa7WHKViqBD2BU0jYOxlM21pkxBtHOSvSAZBcs0Nuf0wPxKXEZ9C1kwJiv7XHtkFY');">
                        </div>
                    </div>
                    <div class="mt-8 text-center">
                        <h3
                            class="text-3xl font-black text-doodle-black dark:text-white mb-2 leading-none uppercase tracking-tighter">
                            Ready to Remix?</h3>
                        <p class="text-[#974e5d] dark:text-primary font-medium italic">Join the customization
                            revolution.</p>
                    </div>
                </div>
                <div class="w-full md:w-1/2 bg-off-white dark:bg-[#1a1a1a] p-8 md:p-12 flex flex-col justify-center">
                    <div class="flex items-center justify-between mb-6">
                        <div class="flex gap-2">
                            <button id="tabLoginBtn"
                                class="px-4 py-2 font-black uppercase border-2 border-doodle-black rounded-lg bg-primary text-white">Đăng
                                nhập</button>
                            <button id="tabRegisterBtn"
                                class="px-4 py-2 font-black uppercase border-2 border-doodle-black rounded-lg bg-white text-doodle-black">Đăng
                                ký</button>
                        </div>
                        <button id="authCloseBtn" class="p-2 rounded-lg border-2 border-doodle-black">
                            <span class="material-symbols-outlined">close</span>
                        </button>
                    </div>
                    <div id="loginPanel" class="space-y-6">
                        <div class="mb-2">
                            <h1 class="text-3xl font-black text-doodle-black dark:text-white">HEY THERE!</h1>
                            <p class="text-[#974e5d] dark:text-zinc-400">Đăng nhập vào Kiss Kit</p>
                        </div>
                        <c:if test="${not empty sessionScope.loginError}">
                            <div class="px-4 py-3 rounded-lg border-2 border-red-600 bg-red-50 text-red-700 font-bold">
                                ${sessionScope.loginError}
                            </div>
                        </c:if>
                        <form method="post" action="${pageContext.request.contextPath}/login" class="space-y-4">
                            <div>
                                <span
                                    class="text-doodle-black dark:text-white text-sm font-bold uppercase tracking-wider ml-1">Email</span>
                                <input name="email" type="email"
                                    value="${not empty sessionScope.loginEmail ? sessionScope.loginEmail : ''}"
                                    class="mt-1 w-full rounded-xl border-4 border-doodle-black bg-white dark:bg-zinc-800 p-4 text-doodle-black dark:text-white focus:ring-0 focus:border-primary placeholder:text-zinc-400 font-medium transition-all"
                                    placeholder="email@domain.com" />
                            </div>
                            <div>
                                <span
                                    class="text-doodle-black dark:text-white text-sm font-bold uppercase tracking-wider ml-1">Mật
                                    khẩu</span>
                                <input name="password" type="password"
                                    class="mt-1 w-full rounded-xl border-4 border-doodle-black bg-white dark:bg-zinc-800 p-4 text-doodle-black dark:text-white focus:ring-0 focus:border-primary placeholder:text-zinc-400 font-medium transition-all"
                                    placeholder="••••••••" />
                            </div>
                            <button
                                class="bg-primary text-white text-xl font-black px-6 py-3 rounded-xl shadow-hard hover:translate-x-1 hover:translate-y-1 hover:shadow-none transition-all uppercase tracking-tight w-full">Đăng
                                nhập</button>
                            <div class="text-sm text-zinc-500">Chưa có tài khoản? <a href="#"
                                    class="font-bold text-primary"
                                    onclick="switchAuthTab('register'); return false;">Đăng ký</a></div>
                        </form>
                    </div>
                    <div id="registerPanel" class="space-y-6 hidden">
                        <div class="mb-2">
                            <h1 class="text-3xl font-black text-doodle-black dark:text-white">WELCOME!</h1>
                            <p class="text-[#974e5d] dark:text-zinc-400">Tạo tài khoản Kiss Kit</p>
                        </div>
                        <c:if test="${not empty sessionScope.registerError}">
                            <div class="px-4 py-3 rounded-lg border-2 border-red-600 bg-red-50 text-red-700 font-bold">
                                ${sessionScope.registerError}
                            </div>
                        </c:if>
                        <form method="post" action="${pageContext.request.contextPath}/register" class="space-y-4">
                            <div>
                                <span
                                    class="text-doodle-black dark:text-white text-sm font-bold uppercase tracking-wider ml-1">Họ
                                    tên</span>
                                <input name="fullName"
                                    value="${not empty sessionScope.regFullName ? sessionScope.regFullName : ''}"
                                    type="text"
                                    class="mt-1 w-full rounded-xl border-4 border-doodle-black bg-white dark:bg-zinc-800 p-4 text-doodle-black dark:text-white focus:ring-0 focus:border-primary placeholder:text-zinc-400 font-medium transition-all"
                                    placeholder="Tên của bạn" />
                            </div>
                            <div>
                                <span
                                    class="text-doodle-black dark:text-white text-sm font-bold uppercase tracking-wider ml-1">Email</span>
                                <input name="email"
                                    value="${not empty sessionScope.regEmail ? sessionScope.regEmail : ''}" type="email"
                                    class="mt-1 w-full rounded-xl border-4 border-doodle-black bg-white dark:bg-zinc-800 p-4 text-doodle-black dark:text-white focus:ring-0 focus:border-primary placeholder:text-zinc-400 font-medium transition-all"
                                    placeholder="email@domain.com" />
                            </div>
                            <div>
                                <span
                                    class="text-doodle-black dark:text-white text-sm font-bold uppercase tracking-wider ml-1">Số
                                    điện thoại</span>
                                <input name="phone"
                                    value="${not empty sessionScope.regPhone ? sessionScope.regPhone : ''}" type="text"
                                    class="mt-1 w-full rounded-xl border-4 border-doodle-black bg-white dark:bg-zinc-800 p-4 text-doodle-black dark:text-white focus:ring-0 focus:border-primary placeholder:text-zinc-400 font-medium transition-all"
                                    placeholder="09xxxxxxxx" />
                            </div>
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <span
                                        class="text-doodle-black dark:text-white text-sm font-bold uppercase tracking-wider ml-1">Mật
                                        khẩu</span>
                                    <input name="password" type="password"
                                        class="mt-1 w-full rounded-xl border-4 border-doodle-black bg-white dark:bg-zinc-800 p-4 text-doodle-black dark:text-white focus:ring-0 focus:border-primary placeholder:text-zinc-400 font-medium transition-all"
                                        placeholder="••••••••" />
                                </div>
                                <div>
                                    <span
                                        class="text-doodle-black dark:text-white text-sm font-bold uppercase tracking-wider ml-1">Xác
                                        nhận</span>
                                    <input name="confirmPassword" type="password"
                                        class="mt-1 w-full rounded-xl border-4 border-doodle-black bg-white dark:bg-zinc-800 p-4 text-doodle-black dark:text-white focus:ring-0 focus:border-primary placeholder:text-zinc-400 font-medium transition-all"
                                        placeholder="••••••••" />
                                </div>
                            </div>
                            <button
                                class="bg-primary text-white text-xl font-black px-6 py-3 rounded-xl shadow-hard hover:translate-x-1 hover:translate-y-1 hover:shadow-none transition-all uppercase tracking-tight w-full">Đăng
                                ký</button>
                            <div class="text-sm text-zinc-500">Đã có tài khoản? <a href="#"
                                    class="font-bold text-primary" onclick="switchAuthTab('login'); return false;">Đăng
                                    nhập</a></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            (function () {
                const pageRoot = document.getElementById('pageRoot');
                const overlay = document.getElementById('authOverlay');
                const modal = document.getElementById('authModal');
                const loginPanel = document.getElementById('loginPanel');
                const registerPanel = document.getElementById('registerPanel');
                const tabLoginBtn = document.getElementById('tabLoginBtn');
                const tabRegisterBtn = document.getElementById('tabRegisterBtn');

                function updateTabButtons(tab) {
                    if (tab === 'register') {
                        tabRegisterBtn.classList.add('bg-primary', 'text-white');
                        tabRegisterBtn.classList.remove('bg-white', 'text-doodle-black');
                        tabLoginBtn.classList.remove('bg-primary', 'text-white');
                        tabLoginBtn.classList.add('bg-white', 'text-doodle-black');
                    } else {
                        tabLoginBtn.classList.add('bg-primary', 'text-white');
                        tabLoginBtn.classList.remove('bg-white', 'text-doodle-black');
                        tabRegisterBtn.classList.remove('bg-primary', 'text-white');
                        tabRegisterBtn.classList.add('bg-white', 'text-doodle-black');
                    }
                }

                function switchTab(tab) {
                    if (tab === 'register') {
                        loginPanel.classList.add('hidden');
                        registerPanel.classList.remove('hidden');
                    } else {
                        registerPanel.classList.add('hidden');
                        loginPanel.classList.remove('hidden');
                    }
                    updateTabButtons(tab);
                }

                function openAuth(tab) {
                    overlay.classList.remove('hidden');
                    modal.classList.remove('hidden');
                    modal.classList.add('flex');
                    if (pageRoot) pageRoot.classList.add('page-blur');
                    switchTab(tab || 'login');
                }

                function closeAuth() {
                    overlay.classList.add('hidden');
                    modal.classList.add('hidden');
                    modal.classList.remove('flex');
                    if (pageRoot) pageRoot.classList.remove('page-blur');
                }

                window.switchAuthTab = switchTab;
                window.openAuth = openAuth;
                window.closeAuth = closeAuth;

                const openBtn = document.getElementById('openAuthBtn');
                if (openBtn) openBtn.addEventListener('click', function () { openAuth('login'); });
                const closeBtn = document.getElementById('authCloseBtn');
                if (closeBtn) closeBtn.addEventListener('click', closeAuth);
                if (overlay) overlay.addEventListener('click', closeAuth);
                if (tabLoginBtn) tabLoginBtn.addEventListener('click', function () { switchTab('login'); });
                if (tabRegisterBtn) tabRegisterBtn.addEventListener('click', function () { switchTab('register'); });

                var initial = '${sessionScope.openAuthModal}';
                if (initial === 'register') {
                    openAuth('register');
                } else if (initial === 'login') {
                    openAuth('login');
                }
            })();
        </script>