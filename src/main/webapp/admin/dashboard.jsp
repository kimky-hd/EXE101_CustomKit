<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html class="light" lang="en">

        <head>
            <meta charset="utf-8" />
            <meta content="width=device-width, initial-scale=1.0" name="viewport" />
            <title>Fiori Launchpad Dashboard - Kiss Kit</title>
            <!-- Fonts -->
            <link href="https://fonts.googleapis.com" rel="preconnect" />
            <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect" />
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap"
                rel="stylesheet" />
            <link
                href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
                rel="stylesheet" />
            <link
                href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
                rel="stylesheet" />
            <!-- Tailwind CSS -->
            <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
            <!-- Theme Config -->
            <script id="tailwind-config">
                tailwind.config = {
                    darkMode: "class",
                    theme: {
                        extend: {
                            colors: {
                                "primary": "#ec1337",
                                "background-light": "#f4f4f4",
                                "background-dark": "#221013",
                                "surface-light": "#ffffff",
                                "surface-dark": "#331c20",
                                "text-main": "#1b0d10",
                                "text-sub": "#6b7280",
                            },
                            fontFamily: {
                                "display": ["Inter", "sans-serif"],
                                "body": ["Inter", "sans-serif"],
                            },
                            borderRadius: { "DEFAULT": "0.375rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px" },
                            boxShadow: {
                                'tile': '0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)',
                                'tile-hover': '0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06)',
                            }
                        },
                    },
                }
            </script>
            <style>
                /* Custom scrollbar for a cleaner look */
                ::-webkit-scrollbar {
                    width: 8px;
                    height: 8px;
                }

                ::-webkit-scrollbar-track {
                    background: transparent;
                }

                ::-webkit-scrollbar-thumb {
                    background: #cbd5e1;
                    border-radius: 4px;
                }

                ::-webkit-scrollbar-thumb:hover {
                    background: #94a3b8;
                }
            </style>
        </head>

        <body
            class="bg-background-light dark:bg-background-dark text-text-main font-display min-h-screen flex flex-col overflow-x-hidden">

            <jsp:include page="common/header.jsp" />

            <!-- Main Content Area -->
            <main class="flex-1 w-full max-w-[1440px] mx-auto p-4 sm:p-6 lg:p-8">
                <!-- Section: My Apps -->
                <div class="mb-8">
                    <div class="flex items-center justify-between mb-4 px-1">
                        <h2 class="text-xl font-semibold text-gray-800 dark:text-white tracking-tight">My Apps</h2>
                        <button class="text-sm text-primary font-medium hover:underline">Edit Home Page</button>
                    </div>
                    <!-- Fiori Tile Grid -->
                    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-4">
                        <!-- Tile 1: Customer Mailbox (Critical) -->
                        <div
                            class="group relative flex flex-col justify-between h-44 p-4 bg-surface-light dark:bg-surface-dark rounded-lg shadow-tile hover:shadow-tile-hover hover:border-primary/50 border border-transparent transition-all cursor-pointer ring-1 ring-black/5 dark:ring-white/10">
                            <div class="flex flex-col">
                                <h3 class="font-semibold text-gray-900 dark:text-white leading-tight">Hộp thư khách hàng
                                </h3>
                                <p class="text-xs text-gray-500 mt-1">Inbox &amp; Requests</p>
                            </div>
                            <div class="flex items-end justify-between mt-auto">
                                <span
                                    class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[32px] group-hover:text-primary transition-colors">mail</span>
                                <!-- Notification Badge -->
                                <div
                                    class="flex items-center justify-center min-w-[28px] h-7 px-2 rounded-full bg-primary text-white text-sm font-bold shadow-sm">
                                    3
                                </div>
                            </div>
                            <!-- Hover Line Top -->
                            <div
                                class="absolute top-0 left-0 w-full h-1 bg-primary scale-x-0 group-hover:scale-x-100 transition-transform origin-left rounded-t-lg">
                            </div>
                        </div>
                        <!-- Tile 2: User Management -->
                        <div
                            class="group relative flex flex-col justify-between h-44 p-4 bg-surface-light dark:bg-surface-dark rounded-lg shadow-tile hover:shadow-tile-hover border border-transparent transition-all cursor-pointer ring-1 ring-black/5 dark:ring-white/10">
                            <div class="flex flex-col">
                                <h3 class="font-semibold text-gray-900 dark:text-white leading-tight">User Management
                                </h3>
                                <p class="text-xs text-gray-500 mt-1">Manage Agents</p>
                            </div>
                            <div class="flex items-end justify-end mt-auto">
                                <span
                                    class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[32px] group-hover:text-primary transition-colors">badge</span>
                            </div>
                        </div>
                        <!-- Tile 3: Call Logs -->
                        <div
                            class="group relative flex flex-col justify-between h-44 p-4 bg-surface-light dark:bg-surface-dark rounded-lg shadow-tile hover:shadow-tile-hover border border-transparent transition-all cursor-pointer ring-1 ring-black/5 dark:ring-white/10">
                            <div class="flex flex-col">
                                <h3 class="font-semibold text-gray-900 dark:text-white leading-tight">Call Logs</h3>
                                <p class="text-xs text-gray-500 mt-1">Recent History</p>
                            </div>
                            <div class="flex items-end justify-between mt-auto w-full">
                                <div class="text-2xl font-bold text-gray-700 dark:text-gray-200">24 <span
                                        class="text-xs font-normal text-gray-400 align-middle">today</span></div>
                                <span
                                    class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[32px] group-hover:text-primary transition-colors">call</span>
                            </div>
                        </div>
                        <!-- Tile 4: Performance Analytics -->
                        <div
                            class="group relative flex flex-col justify-between h-44 p-4 bg-surface-light dark:bg-surface-dark rounded-lg shadow-tile hover:shadow-tile-hover border border-transparent transition-all cursor-pointer ring-1 ring-black/5 dark:ring-white/10">
                            <div class="flex flex-col">
                                <h3 class="font-semibold text-gray-900 dark:text-white leading-tight">Analytics</h3>
                                <p class="text-xs text-gray-500 mt-1">Performance KPIs</p>
                            </div>
                            <div class="w-full mt-auto">
                                <!-- Micro Chart Visualization -->
                                <div
                                    class="flex items-end gap-1 h-12 w-full mb-2 opacity-60 group-hover:opacity-100 transition-opacity">
                                    <div class="w-1/5 bg-gray-200 dark:bg-gray-700 h-1/3 rounded-t-sm"></div>
                                    <div class="w-1/5 bg-gray-300 dark:bg-gray-600 h-2/3 rounded-t-sm"></div>
                                    <div class="w-1/5 bg-primary/40 h-1/2 rounded-t-sm"></div>
                                    <div class="w-1/5 bg-primary/60 h-3/4 rounded-t-sm"></div>
                                    <div class="w-1/5 bg-primary h-full rounded-t-sm"></div>
                                </div>
                                <div class="flex items-end justify-end">
                                    <span
                                        class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[32px] group-hover:text-primary transition-colors">monitoring</span>
                                </div>
                            </div>
                        </div>
                        <!-- Tile 5: Knowledge Base -->
                        <div
                            class="group relative flex flex-col justify-between h-44 p-4 bg-surface-light dark:bg-surface-dark rounded-lg shadow-tile hover:shadow-tile-hover border border-transparent transition-all cursor-pointer ring-1 ring-black/5 dark:ring-white/10">
                            <div class="flex flex-col">
                                <h3 class="font-semibold text-gray-900 dark:text-white leading-tight">Wiki</h3>
                                <p class="text-xs text-gray-500 mt-1">SOPs &amp; Guides</p>
                            </div>
                            <div class="flex items-end justify-end mt-auto">
                                <span
                                    class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[32px] group-hover:text-primary transition-colors">menu_book</span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Section: Admin Tools -->
                <div class="mb-8 pt-4 border-t border-gray-200 dark:border-gray-800/50">
                    <h2 class="text-xl font-semibold text-gray-800 dark:text-white tracking-tight mb-4 px-1">Admin Tools
                    </h2>
                    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-4">
                        <!-- Tile: System Settings -->
                        <div
                            class="group relative flex flex-col justify-between h-44 p-4 bg-surface-light dark:bg-surface-dark rounded-lg shadow-tile hover:shadow-tile-hover border border-transparent transition-all cursor-pointer ring-1 ring-black/5 dark:ring-white/10">
                            <div class="flex flex-col">
                                <h3 class="font-semibold text-gray-900 dark:text-white leading-tight">System Settings
                                </h3>
                                <p class="text-xs text-gray-500 mt-1">Configure platform</p>
                            </div>
                            <div class="flex items-end justify-end mt-auto">
                                <span
                                    class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[32px] group-hover:text-primary transition-colors">settings_applications</span>
                            </div>
                        </div>
                        <!-- Tile: Integrations (Wide Tile Example) -->
                        <div
                            class="group relative flex flex-row sm:col-span-2 justify-between h-44 p-4 bg-surface-light dark:bg-surface-dark rounded-lg shadow-tile hover:shadow-tile-hover border border-transparent transition-all cursor-pointer ring-1 ring-black/5 dark:ring-white/10 overflow-hidden">
                            <div class="flex flex-col z-10 max-w-[60%]">
                                <h3 class="font-semibold text-gray-900 dark:text-white leading-tight">Integration Health
                                </h3>
                                <p class="text-xs text-gray-500 mt-1">CRM, VoIP, &amp; Chat</p>
                                <div class="mt-auto flex items-center gap-2">
                                    <span class="flex size-2 rounded-full bg-green-500"></span>
                                    <span class="text-sm font-medium text-green-700 dark:text-green-400">All Systems
                                        Operational</span>
                                </div>
                            </div>
                            <!-- Decorative Graphic -->
                            <div class="absolute right-0 top-0 bottom-0 w-1/2 opacity-10 dark:opacity-20"
                                style="background: radial-gradient(circle at center right, #ec1337 0%, transparent 70%);">
                            </div>
                            <div class="flex items-end justify-end mt-auto z-10">
                                <span
                                    class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[32px] group-hover:text-primary transition-colors">hub</span>
                            </div>
                        </div>
                        <!-- Tile: Audit Logs -->
                        <div
                            class="group relative flex flex-col justify-between h-44 p-4 bg-surface-light dark:bg-surface-dark rounded-lg shadow-tile hover:shadow-tile-hover border border-transparent transition-all cursor-pointer ring-1 ring-black/5 dark:ring-white/10">
                            <div class="flex flex-col">
                                <h3 class="font-semibold text-gray-900 dark:text-white leading-tight">Audit Logs</h3>
                                <p class="text-xs text-gray-500 mt-1">Security &amp; Access</p>
                            </div>
                            <div class="flex items-end justify-end mt-auto">
                                <span
                                    class="material-symbols-outlined text-gray-400 dark:text-gray-500 text-[32px] group-hover:text-primary transition-colors">security</span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Section: Quick Links (Footer area) -->
                <div
                    class="flex flex-wrap gap-4 px-1 py-8 text-sm text-gray-500 border-t border-gray-200 dark:border-gray-800/50 mt-auto">
                    <a class="hover:text-primary transition-colors" href="#">Kiss Kit Support</a>
                    <span>•</span>
                    <a class="hover:text-primary transition-colors" href="#">Documentation</a>
                    <span>•</span>
                    <a class="hover:text-primary transition-colors" href="#">Privacy Policy</a>
                    <span>•</span>
                    <span class="ml-auto opacity-75">v2.4.0-stable</span>
                </div>
            </main>
        </body>

        </html>