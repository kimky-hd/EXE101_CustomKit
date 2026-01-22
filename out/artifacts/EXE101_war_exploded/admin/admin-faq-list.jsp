<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <!DOCTYPE html>
            <html class="light" lang="en">

            <head>
                <meta charset="utf-8" />
                <meta content="width=device-width, initial-scale=1.0" name="viewport" />
                <title>FAQ List Report Management</title>
                <link
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
                    rel="stylesheet" />
                <link href="https://fonts.googleapis.com" rel="preconnect" />
                <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect" />
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap"
                    rel="stylesheet" />
                <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
                <script id="tailwind-config">
                    tailwind.config = {
                        darkMode: "class",
                        theme: {
                            extend: {
                                colors: {
                                    "primary": "#ec1313",
                                    "primary-hover": "#c90f0f",
                                    "background-light": "#f4f4f4",
                                    "background-dark": "#1a1a1a",
                                    "surface-light": "#ffffff",
                                    "surface-dark": "#2d2d2d",
                                    "border-light": "#e0e0e0",
                                    "border-dark": "#404040",
                                    "text-primary": "#1b0d0d",
                                    "text-secondary": "#5f6368",
                                },
                                fontFamily: {
                                    "display": ["Inter", "sans-serif"]
                                },
                                borderRadius: {
                                    "DEFAULT": "0.25rem",
                                    "lg": "0.5rem",
                                    "xl": "0.75rem",
                                    "full": "9999px"
                                },
                            },
                        },
                    }
                </script>
                <style>
                    body {
                        font-family: 'Inter', sans-serif;
                    }

                    .custom-scrollbar::-webkit-scrollbar {
                        height: 8px;
                        width: 8px;
                    }

                    .custom-scrollbar::-webkit-scrollbar-track {
                        background: #f1f1f1;
                    }

                    .custom-scrollbar::-webkit-scrollbar-thumb {
                        background: #ccc;
                        border-radius: 4px;
                    }

                    .custom-scrollbar::-webkit-scrollbar-thumb:hover {
                        background: #aaa;
                    }
                </style>
            </head>

            <body class="bg-background-light dark:bg-background-dark text-text-primary min-h-screen flex flex-col">

                <!-- Top Navigation Bar -->
                <header
                    class="sticky top-0 z-50 flex h-12 w-full items-center justify-between bg-surface-light dark:bg-surface-dark px-4 shadow-sm border-b border-border-light dark:border-border-dark">
                    <div class="flex items-center gap-3">
                        <button
                            class="flex items-center justify-center text-text-secondary hover:bg-gray-100 dark:hover:bg-gray-700 p-2 rounded-full">
                            <span class="material-symbols-outlined text-[20px]">menu</span>
                        </button>
                        <div class="flex items-center gap-2">
                            <div class="size-6 text-primary flex items-center justify-center">
                                <span class="material-symbols-outlined text-[24px]">verified</span>
                            </div>
                            <h1 class="text-base font-bold tracking-tight text-text-primary dark:text-white">Kiss Kit
                                Admin</h1>
                        </div>
                    </div>
                    <div class="flex items-center gap-1">
                        <button
                            class="flex items-center justify-center text-text-secondary hover:bg-gray-100 dark:hover:bg-gray-700 p-2 rounded-full size-10">
                            <span class="material-symbols-outlined text-[20px]">search</span>
                        </button>
                        <button
                            class="flex items-center justify-center text-text-secondary hover:bg-gray-100 dark:hover:bg-gray-700 p-2 rounded-full size-10 relative">
                            <span class="material-symbols-outlined text-[20px]">notifications</span>
                            <span
                                class="absolute top-2 right-2 size-2 bg-primary rounded-full border border-white"></span>
                        </button>
                        <button
                            class="ml-2 flex items-center justify-center overflow-hidden rounded-full size-8 bg-gray-200 border border-border-light">
                            <div class="bg-center bg-no-repeat bg-cover w-full h-full"
                                style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuCY_8EcmGsMNfWYz-4AFHiBqP4t3gHW8d0IEqDwvoudUd5QHDP6V1lONnyOYHuXM2xeyOOLip1OwQFA9tNr-89AUEOEWJd2xmIqEVf41pQcSD_Y3deUGpPgrUKQCUq4TlfCFTgxikE7fSwS3wA09fOrEqWLBEGeNalSzObUYbMSOkCdSrkafkpVcioChO1GJARQrN6ZGrS36ab4kqn8qcgAmADPC7rASXO-mHQJPV_u15lAaI23Mc194b4fGRy3D1M1zzpCFvN3jMw");'>
                            </div>
                        </button>
                    </div>
                </header>

                <main class="flex-1 overflow-x-hidden p-4 md:p-6 lg:p-8 w-full max-w-[1440px] mx-auto">
                    <div class="mb-6 flex flex-col gap-1">
                        <nav class="flex items-center text-xs text-text-secondary space-x-1">
                            <span class="cursor-pointer hover:underline">Home</span>
                            <span class="material-symbols-outlined text-[12px]">chevron_right</span>
                            <span class="cursor-pointer hover:underline">Admin</span>
                            <span class="material-symbols-outlined text-[12px]">chevron_right</span>
                            <span class="font-medium text-text-primary dark:text-white">FAQs</span>
                        </nav>
                        <h2 class="text-2xl font-bold text-text-primary dark:text-white">FAQ Management</h2>
                    </div>

                    <div
                        class="flex flex-col bg-surface-light dark:bg-surface-dark rounded-lg shadow-sm border border-border-light dark:border-border-dark overflow-hidden">
                        <!-- Filter Bar Section -->
                        <form method="GET" action="faq"
                            class="flex flex-col lg:flex-row items-start lg:items-end gap-4 p-4 border-b border-border-light dark:border-border-dark bg-white dark:bg-[#2d2d2d]">
                            <div class="flex flex-col gap-1.5 w-full lg:w-1/3">
                                <label class="text-sm font-medium text-text-secondary" for="search-faq">Search</label>
                                <div class="relative">
                                    <input name="search" value="${paramSearch}"
                                        class="w-full pl-10 pr-4 py-2 text-sm border border-border-light dark:border-border-dark rounded-md bg-background-light dark:bg-background-dark focus:ring-1 focus:ring-primary focus:border-primary focus:outline-none transition-shadow text-text-primary dark:text-white placeholder-text-secondary"
                                        id="search-faq" placeholder="Search by question, ID..." type="text" />
                                    <span
                                        class="material-symbols-outlined absolute left-3 top-2 text-text-secondary text-[18px]">search</span>
                                </div>
                            </div>

                            <div class="flex flex-col gap-1.5 w-full lg:w-1/4">
                                <label class="text-sm font-medium text-text-secondary" for="status-filter">Trạng thái
                                    (Status)</label>
                                <div class="relative">
                                    <select name="status"
                                        class="w-full pl-3 pr-10 py-2 text-sm border border-border-light dark:border-border-dark rounded-md bg-background-light dark:bg-background-dark focus:ring-1 focus:ring-primary focus:border-primary focus:outline-none appearance-none text-text-primary dark:text-white cursor-pointer"
                                        id="status-filter">
                                        <option value="">All Statuses</option>
                                        <option value="PUBLISHED" ${paramStatus=='PUBLISHED' ? 'selected' : '' }>
                                            Published</option>
                                        <option value="DRAFT" ${paramStatus=='DRAFT' ? 'selected' : '' }>Draft</option>
                                        <option value="ARCHIVED" ${paramStatus=='ARCHIVED' ? 'selected' : '' }>Archived
                                        </option>
                                    </select>
                                    <span
                                        class="material-symbols-outlined absolute right-3 top-2 text-text-secondary text-[20px] pointer-events-none">arrow_drop_down</span>
                                </div>
                            </div>

                            <div class="flex flex-col gap-1.5 w-full lg:w-1/4">
                                <label class="text-sm font-medium text-text-secondary"
                                    for="category-filter">Category</label>
                                <div class="relative">
                                    <select name="categoryId"
                                        class="w-full pl-3 pr-10 py-2 text-sm border border-border-light dark:border-border-dark rounded-md bg-background-light dark:bg-background-dark focus:ring-1 focus:ring-primary focus:border-primary focus:outline-none appearance-none text-text-primary dark:text-white cursor-pointer"
                                        id="category-filter">
                                        <option value="">All Categories</option>
                                        <c:forEach items="${categories}" var="cat">
                                            <option value="${cat.id}" ${paramCategoryId==(cat.id + '' ) ? 'selected'
                                                : '' }>${cat.name}</option>
                                        </c:forEach>
                                    </select>
                                    <span
                                        class="material-symbols-outlined absolute right-3 top-2 text-text-secondary text-[20px] pointer-events-none">arrow_drop_down</span>
                                </div>
                            </div>

                            <button type="submit"
                                class="h-[38px] px-6 bg-primary/10 hover:bg-primary/20 text-primary font-medium text-sm rounded-md transition-colors duration-200 mt-2 lg:mt-0 flex items-center justify-center">
                                Go
                            </button>
                        </form>

                        <!-- Table Toolbar -->
                        <div
                            class="flex items-center justify-between px-4 py-3 bg-white dark:bg-[#2d2d2d] border-b border-border-light dark:border-border-dark">
                            <div class="flex items-center gap-2">
                                <h3 class="text-base font-semibold text-text-primary dark:text-white">Items
                                    (${faqList.size()})</h3>
                            </div>
                            <div class="flex items-center gap-2">
                                <button
                                    class="p-2 text-text-secondary hover:text-primary hover:bg-primary/5 rounded-md transition-colors"
                                    title="Settings">
                                    <span class="material-symbols-outlined text-[20px]">settings</span>
                                </button>
                                <button
                                    class="p-2 text-text-secondary hover:text-primary hover:bg-primary/5 rounded-md transition-colors"
                                    title="Export">
                                    <span class="material-symbols-outlined text-[20px]">download</span>
                                </button>
                                <div class="h-6 w-px bg-border-light dark:bg-border-dark mx-1"></div>
                                <a href="faq/manage"
                                    class="flex items-center gap-2 bg-primary hover:bg-primary-hover text-white px-4 py-2 rounded-md text-sm font-bold shadow-sm transition-all active:scale-95">
                                    <span class="material-symbols-outlined text-[18px]">add</span>
                                    Create New
                                </a>
                            </div>
                        </div>

                        <!-- Data Grid Table -->
                        <div class="overflow-x-auto custom-scrollbar">
                            <table class="w-full text-left border-collapse">
                                <thead>
                                    <tr
                                        class="bg-gray-50 dark:bg-[#333] border-b border-border-light dark:border-border-dark">
                                        <th
                                            class="py-3 px-4 text-xs font-semibold uppercase tracking-wider text-text-secondary w-20">
                                            ID</th>
                                        <th
                                            class="py-3 px-4 text-xs font-semibold uppercase tracking-wider text-text-secondary min-w-[300px]">
                                            Question</th>
                                        <th
                                            class="py-3 px-4 text-xs font-semibold uppercase tracking-wider text-text-secondary w-40">
                                            Category</th>
                                        <th
                                            class="py-3 px-4 text-xs font-semibold uppercase tracking-wider text-text-secondary w-32">
                                            Status</th>
                                        <th
                                            class="py-3 px-4 text-xs font-semibold uppercase tracking-wider text-text-secondary w-40">
                                            Created Date</th>
                                        <th
                                            class="py-3 px-4 text-xs font-semibold uppercase tracking-wider text-text-secondary w-24 text-right">
                                            Actions</th>
                                    </tr>
                                </thead>
                                <tbody
                                    class="divide-y divide-border-light dark:divide-border-dark bg-white dark:bg-[#2d2d2d]">
                                    <c:forEach items="${faqList}" var="faq">
                                        <tr
                                            class="group hover:bg-gray-50 dark:hover:bg-[#383838] transition-colors cursor-pointer">
                                            <td class="py-3 px-4 text-sm font-medium text-text-primary dark:text-white">
                                                ${faq.id}</td>
                                            <td
                                                class="py-3 px-4 text-sm text-text-primary dark:text-gray-200 font-medium">
                                                ${faq.question}</td>
                                            <td class="py-3 px-4 text-sm text-text-secondary">${faq.categoryName != null
                                                ? faq.categoryName : 'Uncategorized'}</td>
                                            <td class="py-3 px-4">
                                                <c:choose>
                                                    <c:when test="${faq.status == 'PUBLISHED'}">
                                                        <span
                                                            class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200">Published</span>
                                                    </c:when>
                                                    <c:when test="${faq.status == 'DRAFT'}">
                                                        <span
                                                            class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-orange-100 text-orange-800 dark:bg-orange-900 dark:text-orange-200">Draft</span>
                                                    </c:when>
                                                    <c:when test="${faq.status == 'ARCHIVED'}">
                                                        <span
                                                            class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-gray-100 text-gray-800 dark:bg-gray-700 dark:text-gray-300">Archived</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span
                                                            class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-gray-100 text-gray-800">${faq.status}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td class="py-3 px-4 text-sm text-text-secondary">
                                                <fmt:parseDate value="${faq.createdAt}" pattern="yyyy-MM-dd'T'HH:mm"
                                                    var="parsedDate" type="both" />
                                                <fmt:formatDate value="${parsedDate}" pattern="MMM dd, yyyy" />
                                            </td>
                                            <td class="py-3 px-4 text-right">
                                                <div
                                                    class="flex items-center justify-end gap-1 opacity-0 group-hover:opacity-100 transition-opacity">
                                                    <a href="faq/manage?id=${faq.id}"
                                                        class="p-1.5 text-text-secondary hover:text-primary rounded-md hover:bg-primary/5 transition-colors">
                                                        <span class="material-symbols-outlined text-[18px]">edit</span>
                                                    </a>
                                                    <a href="faq?action=delete&id=${faq.id}"
                                                        onclick="return confirm('Are you sure you want to delete this FAQ?');"
                                                        class="p-1.5 text-text-secondary hover:text-red-600 rounded-md hover:bg-red-50 transition-colors">
                                                        <span
                                                            class="material-symbols-outlined text-[18px]">delete</span>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty faqList}">
                                        <tr>
                                            <td colspan="6" class="py-8 text-center text-text-secondary">No FAQs found
                                                matching your criteria.</td>
                                        </tr>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>

                        <!-- Pagination (Static for now) -->
                        <div
                            class="flex flex-col sm:flex-row items-center justify-between p-4 border-t border-border-light dark:border-border-dark bg-white dark:bg-[#2d2d2d]">
                            <div class="text-sm text-text-secondary mb-2 sm:mb-0">
                                Showing <span class="font-medium">1</span> to <span
                                    class="font-medium">${faqList.size()}</span> results
                            </div>
                            <!-- Pagination log omitted -->
                        </div>
                    </div>
                </main>
            </body>

            </html>