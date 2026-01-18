<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!-- Top Navigation -->
<header class="fixed top-0 inset-x-0 z-50 w-full border-b-2 border-doodle-black bg-white/90 dark:bg-background-dark/90 backdrop-blur-sm px-6 lg:px-20 py-4">
    <div class="max-w-[1200px] mx-auto flex items-center justify-between">
        <div class="flex items-center gap-3">
            <div class="bg-primary p-1 rounded-lg rotate-[-3deg] shadow-hard">
                <span class="material-symbols-outlined text-white text-2xl">brush</span>
            </div>
            <h2 class="text-2xl font-black tracking-tighter uppercase italic">Kiss Kit</h2>
        </div>
        <nav class="hidden md:flex items-center gap-10">
            <a class="font-bold hover:text-primary transition-colors" href="#">SẢN PHẨM</a>
            <a class="font-bold hover:text-primary transition-colors" href="#">HƯỚNG DẪN</a>
            <a class="font-bold hover:text-primary transition-colors" href="#">CẢM HỨNG</a>
            <a class="font-bold hover:text-primary transition-colors" href="#">LIÊN HỆ</a>
        </nav>
        <%
            com.papericious.model.Account currentUser = (com.papericious.model.Account) session.getAttribute("currentUser");
        %>
        <div class="flex items-center gap-4">
            <button class="flex items-center justify-center p-2 rounded-lg border-2 border-doodle-black hover:bg-kraft-brown/20 transition-all">
                <span class="material-symbols-outlined">shopping_cart</span>
            </button>
            <%
                if (currentUser == null) {
            %>
            <button id="openAuthBtn" class="bg-primary text-white font-black px-6 py-2 rounded-lg shadow-hard hover:translate-x-1 hover:translate-y-1 hover:shadow-none transition-all uppercase text-sm">
                Đăng nhập
            </button>
            <%
                } else {
            %>
            <div class="flex items-center gap-2 border-2 border-doodle-black rounded-lg px-3 py-2 bg-white dark:bg-background-dark">
                <span class="font-bold text-sm"><%= currentUser.getFullName() %></span>

                <form method="post" action="<%=request.getContextPath()%>/logout" class="flex items-center m-0">
                    <button class="bg-primary text-white font-black px-3 py-1 rounded-lg shadow-hard transition-all text-xs uppercase">
                        Đăng xuất
                    </button>
                </form>
            </div>
            <%
                }
            %>
        </div>
    </div>
</header>
