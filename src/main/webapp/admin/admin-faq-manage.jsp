<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html class="dark" lang="en">

        <head>
            <meta charset="utf-8" />
            <meta content="width=device-width, initial-scale=1.0" name="viewport" />
            <title>FAQ Detail &amp; Edit Page - Kiss Kit Admin</title>
            <link href="https://fonts.googleapis.com" rel="preconnect" />
            <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect" />
            <link
                href="https://fonts.googleapis.com/css2?family=Spline+Sans:wght@300;400;500;600;700&amp;family=Noto+Sans:wght@400;500;700&amp;display=swap"
                rel="stylesheet" />
            <link
                href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
                rel="stylesheet" />
            <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
            <script id="tailwind-config">
                tailwind.config = {
                    darkMode: "class",
                    theme: {
                        extend: {
                            colors: {
                                "primary": "#ec1337",
                                "background-light": "#f8f6f6",
                                "background-dark": "#221013",
                                "surface-dark": "#2c1519",
                                "border-dark": "#482329",
                                "input-bg": "#33191e",
                                "input-border": "#67323b",
                                "text-muted": "#c9929b"
                            },
                            fontFamily: {
                                "display": ["Spline Sans", "Noto Sans", "sans-serif"],
                            },
                            borderRadius: { "DEFAULT": "0.25rem", "lg": "0.5rem", "xl": "0.75rem", "full": "9999px" },
                        },
                    },
                }
            </script>
            <style>
                ::-webkit-scrollbar {
                    width: 8px;
                    height: 8px;
                }

                ::-webkit-scrollbar-track {
                    background: #221013;
                }

                ::-webkit-scrollbar-thumb {
                    background: #482329;
                    border-radius: 4px;
                }

                ::-webkit-scrollbar-thumb:hover {
                    background: #67323b;
                }
            </style>
        </head>

        <body
            class="font-display bg-background-light dark:bg-background-dark text-slate-900 dark:text-white overflow-hidden h-screen flex flex-col">
            <header
                class="flex-none flex items-center justify-between whitespace-nowrap border-b border-solid border-border-dark dark:bg-[#221114] px-6 py-3 z-20">
                <div class="flex items-center gap-8">
                    <div class="flex items-center gap-3 text-white">
                        <div class="size-8 text-primary flex items-center justify-center">
                            <svg class="w-full h-full" fill="none" viewbox="0 0 48 48"
                                xmlns="http://www.w3.org/2000/svg">
                                <path
                                    d="M42.4379 44C42.4379 44 36.0744 33.9038 41.1692 24C46.8624 12.9336 42.2078 4 42.2078 4L7.01134 4C7.01134 4 11.6577 12.932 5.96912 23.9969C0.876273 33.9029 7.27094 44 7.27094 44L42.4379 44Z"
                                    fill="currentColor"></path>
                            </svg>
                        </div>
                        <h2 class="text-white text-xl font-bold leading-tight tracking-[-0.015em]">Kiss Kit Admin</h2>
                    </div>
                </div>
                <div class="flex flex-1 justify-end gap-6 items-center">
                    <!-- Profile etc. omitted for brevity -->
                </div>
            </header>
            <div class="flex flex-1 overflow-hidden">
                <aside class="hidden md:flex flex-col w-64 bg-[#221114] border-r border-border-dark overflow-y-auto">
                    <div class="p-4 flex flex-col h-full justify-between">
                        <div class="flex flex-col gap-6">
                            <nav class="flex flex-col gap-1">
                                <a class="flex items-center gap-3 px-3 py-2.5 rounded-lg text-text-muted hover:bg-surface-dark hover:text-white transition-all group"
                                    href="${pageContext.request.contextPath}/admin/faq">
                                    <span
                                        class="material-symbols-outlined group-hover:text-primary transition-colors">dashboard</span>
                                    <span class="text-sm font-medium">Dashboard</span>
                                </a>
                                <a class="flex items-center gap-3 px-3 py-2.5 rounded-lg bg-surface-dark text-white border-l-4 border-primary"
                                    href="#">
                                    <span class="material-symbols-outlined text-primary">live_help</span>
                                    <span class="text-sm font-medium">FAQ Management</span>
                                </a>
                            </nav>
                        </div>
                    </div>
                </aside>

                <main class="flex-1 overflow-y-auto relative bg-[#221114]">
                    <div class="flex flex-col min-h-full pb-24">
                        <div class="px-6 md:px-10 py-6">
                            <nav class="flex flex-wrap gap-2 items-center mb-6 text-sm">
                                <a class="text-text-muted hover:text-primary transition-colors"
                                    href="${pageContext.request.contextPath}/admin/faq">Admin</a>
                                <span class="text-border-dark material-symbols-outlined text-base">chevron_right</span>
                                <a class="text-text-muted hover:text-primary transition-colors"
                                    href="${pageContext.request.contextPath}/admin/faq">FAQ Management</a>
                                <span class="text-border-dark material-symbols-outlined text-base">chevron_right</span>
                                <span class="text-white font-medium">${not empty faq ? 'Edit FAQ' : 'Create FAQ'}</span>
                            </nav>
                            <div class="flex flex-col md:flex-row md:items-start justify-between gap-4 mb-8">
                                <div class="flex flex-col gap-2">
                                    <div class="flex items-center gap-3">
                                        <h1 class="text-white text-3xl font-bold tracking-tight">${not empty faq ? 'Edit
                                            FAQ' : 'Create New FAQ'}</h1>
                                        <c:if test="${not empty faq}">
                                            <span
                                                class="px-2.5 py-0.5 rounded-full bg-green-900/40 text-green-400 text-xs font-semibold border border-green-800">${faq.status}</span>
                                        </c:if>
                                    </div>
                                    <p class="text-text-muted text-sm">Manage the content and visibility of this
                                        frequently asked question.</p>
                                </div>
                            </div>
                        </div>

                        <div class="px-6 md:px-10 max-w-5xl mx-auto w-full">
                            <c:if test="${not empty error}">
                                <div class="mb-4 bg-red-900/50 border border-red-500 text-red-100 px-4 py-3 rounded relative"
                                    role="alert">
                                    <span class="block sm:inline">${error}</span>
                                </div>
                            </c:if>

                            <form method="POST" action="manage"
                                class="bg-surface-dark rounded-xl border border-border-dark p-6 md:p-8 shadow-xl">
                                <input type="hidden" name="id" value="${faq.id != null ? faq.id : ''}">

                                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                                    <div class="md:col-span-2 space-y-2">
                                        <label class="block text-white text-sm font-medium" for="faq-question">
                                            Câu hỏi (Question) <span class="text-primary">*</span>
                                        </label>
                                        <div class="relative">
                                            <input name="question" value="${faq.question}" required
                                                class="w-full rounded-lg bg-input-bg border border-input-border text-white placeholder-text-muted focus:border-primary focus:ring-1 focus:ring-primary py-3 px-4 transition-all"
                                                id="faq-question" placeholder="Enter the main question here..."
                                                type="text" />
                                        </div>
                                    </div>

                                    <div class="space-y-2">
                                        <label class="block text-white text-sm font-medium" for="faq-category">
                                            Danh mục (Category)
                                        </label>
                                        <div class="relative">
                                            <select name="categoryId"
                                                class="w-full rounded-lg bg-input-bg border border-input-border text-white focus:border-primary focus:ring-1 focus:ring-primary py-3 px-4 appearance-none transition-all cursor-pointer"
                                                id="faq-category">
                                                <c:forEach items="${categories}" var="cat">
                                                    <option value="${cat.id}" ${faq.categoryId==cat.id ? 'selected' : ''
                                                        }>${cat.name}</option>
                                                </c:forEach>
                                            </select>
                                            <div
                                                class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-4 text-text-muted">
                                                <span class="material-symbols-outlined">expand_more</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="space-y-2 flex flex-col justify-end">
                                        <label class="block text-white text-sm font-medium mb-3">
                                            Trạng thái xuất bản (Publish Status)
                                        </label>
                                        <div
                                            class="flex items-center gap-3 p-3 rounded-lg border border-input-border bg-input-bg/50">
                                            <label class="relative inline-flex items-center cursor-pointer">
                                                <input name="isPublished" type="checkbox" value="true"
                                                    class="sr-only peer" ${faq.status=='PUBLISHED' ? 'checked' : '' }
                                                    ${empty faq ? 'checked' : '' }>
                                                <div
                                                    class="w-11 h-6 bg-border-dark peer-focus:outline-none peer-focus:ring-2 peer-focus:ring-primary/50 rounded-full peer peer-checked:after:translate-x-full rtl:peer-checked:after:-translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:start-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-primary">
                                                </div>
                                                <span class="ms-3 text-sm font-medium text-white">Visible on
                                                    Portal</span>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="md:col-span-2 space-y-2">
                                        <div class="flex justify-between items-center">
                                            <label class="block text-white text-sm font-medium" for="faq-answer">
                                                Trả lời (Answer) <span class="text-primary">*</span>
                                            </label>
                                            <span class="text-xs text-text-muted">Supports Markdown</span>
                                        </div>
                                        <textarea name="answer" required
                                            class="w-full rounded-lg bg-input-bg border border-input-border text-white placeholder-text-muted focus:border-primary focus:ring-1 focus:ring-primary py-3 px-4 transition-all resize-y"
                                            id="faq-answer" placeholder="Provide the detailed answer here..."
                                            rows="8">${faq.answer}</textarea>
                                    </div>
                                </div>

                                <div class="mt-8 flex items-center justify-end gap-4">
                                    <a href="${pageContext.request.contextPath}/admin/faq"
                                        class="px-6 py-2.5 rounded-lg text-white font-medium hover:bg-white/5 border border-transparent hover:border-white/10 transition-all text-sm">
                                        Cancel
                                    </a>
                                    <button type="submit"
                                        class="px-6 py-2.5 rounded-lg bg-primary hover:bg-red-600 text-white font-bold shadow-lg shadow-red-900/20 transition-all text-sm flex items-center gap-2">
                                        <span class="material-symbols-outlined text-[18px]">save</span>
                                        Save Changes
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </main>
            </div>
        </body>

        </html>