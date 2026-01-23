<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!-- Shell Bar (Top Navigation) -->
        <header
            class="sticky top-0 z-50 w-full bg-surface-light dark:bg-surface-dark border-b border-gray-200 dark:border-gray-800 h-14 px-4 flex items-center justify-between shadow-sm">
            <!-- Left: Branding & Menu -->
            <div class="flex items-center gap-4 min-w-fit">
                <button
                    class="p-2 rounded-full hover:bg-gray-100 dark:hover:bg-gray-800 text-gray-600 dark:text-gray-300 transition-colors">
                    <span class="material-symbols-outlined text-[24px]">menu</span>
                </button>
                <div class="flex items-center gap-2">
                    <!-- Logo Icon -->
                    <div class="size-8 bg-primary/10 rounded flex items-center justify-center text-primary">
                        <span class="material-symbols-outlined text-[20px] font-bold">dataset</span>
                    </div>
                    <h1 class="text-lg font-bold tracking-tight text-gray-900 dark:text-white hidden sm:block">Kiss Kit
                    </h1>
                </div>
            </div>
            <!-- Center: Global Search -->
            <div class="flex-1 flex justify-center max-w-2xl px-4">
                <div class="relative w-full max-w-[480px]">
                    <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                        <span class="material-symbols-outlined text-gray-400 text-[20px]">search</span>
                    </div>
                    <input
                        class="block w-full rounded-full border-gray-200 dark:border-gray-700 bg-gray-100 dark:bg-gray-800 py-2 pl-10 pr-4 text-sm text-gray-900 dark:text-white placeholder-gray-500 focus:border-primary focus:ring-1 focus:ring-primary focus:outline-none transition-all"
                        placeholder="Search apps or data..." type="text" />
                </div>
            </div>
            <!-- Right: Actions & Profile -->
            <div class="flex items-center gap-2 sm:gap-4 min-w-fit justify-end">
                <a href="${pageContext.request.contextPath}/index.jsp"
                    class="flex items-center gap-2 px-3 py-1.5 rounded-full bg-primary/10 text-primary hover:bg-primary/20 transition-colors text-sm font-medium">
                    <span class="material-symbols-outlined text-[20px]">storefront</span>
                    <span class="hidden sm:inline">Go to Shop</span>
                </a>

                <button
                    class="relative p-2 rounded-full hover:bg-gray-100 dark:hover:bg-gray-800 text-gray-600 dark:text-gray-300 transition-colors">
                    <span class="material-symbols-outlined text-[24px]">notifications</span>
                    <span
                        class="absolute top-1.5 right-1.5 size-2.5 bg-primary rounded-full border-2 border-white dark:border-surface-dark"></span>
                </button>
                <button
                    class="hidden sm:flex p-2 rounded-full hover:bg-gray-100 dark:hover:bg-gray-800 text-gray-600 dark:text-gray-300 transition-colors">
                    <span class="material-symbols-outlined text-[24px]">settings</span>
                </button>
                <div class="h-8 w-px bg-gray-200 dark:bg-gray-700 mx-1"></div>
                <button
                    class="flex items-center gap-2 rounded-full p-1 pl-2 hover:bg-gray-100 dark:hover:bg-gray-800 transition-colors">
                    <span class="text-sm font-medium text-gray-700 dark:text-gray-200 hidden md:block">Admin User</span>
                    <div class="size-8 rounded-full bg-cover bg-center border border-gray-200 dark:border-gray-700"
                        data-alt="Professional avatar of a user in business attire"
                        style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuBYjECxS4JxC_J_HdVZnD2JyhPabqh7pgMXGxw3nVGJLoU6qXEF9e2ys7hPEsc3X30MKjrE8vCl_Ja-3JL87MxMbiqR5NqQ37xAdmVr3E3MskBuDdPoxm3gHL9B_GwUoyi3sdMWuQbtnkNvrTzcopII9cvLlgUFz3AfMZmug09dpAqqzghJMynqdIwfBGJwUuXRs_kKiGzP8-drv4RjbHsdmC41oraEknlWChHALua8d9VhWKeEh_aPEsJ1hTG9a5V9SFOOcgfDS8U");'>
                    </div>
                </button>
            </div>
        </header>