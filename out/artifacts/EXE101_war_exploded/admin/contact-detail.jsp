<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <!DOCTYPE html>
            <html class="light" lang="en">

            <head>
                <meta charset="utf-8" />
                <meta content="width=device-width, initial-scale=1.0" name="viewport" />
                <title>Message Details - Admin</title>
                <link href="https://fonts.googleapis.com" rel="preconnect" />
                <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect" />
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap"
                    rel="stylesheet" />
                <link
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
                    rel="stylesheet" />
                <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
                <script>
                    tailwind.config = {
                        darkMode: "class",
                        theme: {
                            extend: {
                                colors: {
                                    "primary": "#ec1337",
                                    "background-light": "#f4f4f4",
                                    "surface-light": "#ffffff",
                                    "text-main": "#1b0d10",
                                },
                                fontFamily: { "display": ["Inter", "sans-serif"] },
                            },
                        },
                    }
                </script>
            </head>

            <body class="bg-background-light font-display min-h-screen flex flex-col">

                <jsp:include page="common/header.jsp" />

                <main class="flex-1 w-full max-w-[1000px] mx-auto p-4 sm:p-6 lg:p-8">

                    <!-- Breadcrumb & Back -->
                    <div class="mb-6 flex items-center justify-between flex-wrap gap-4">
                        <div class="flex items-center gap-2 text-sm text-gray-500">
                            <a href="${pageContext.request.contextPath}/admin/dashboard"
                                class="hover:text-primary">Home</a>
                            <span>/</span>
                            <a href="${pageContext.request.contextPath}/admin/contacts"
                                class="hover:text-primary">Customer Mailbox</a>
                            <span>/</span>
                            <span class="text-gray-900 font-medium">Message Details</span>
                        </div>
                        <a href="${pageContext.request.contextPath}/admin/contacts"
                            class="text-sm font-medium text-gray-600 hover:text-primary flex items-center gap-1">
                            <span class="material-symbols-outlined text-[20px]">arrow_back</span>
                            Back to List
                        </a>
                    </div>

                    <div class="bg-surface-light rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                        <!-- Message Header -->
                        <div
                            class="px-6 py-5 border-b border-gray-100 bg-gray-50/50 flex flex-wrap justify-between items-start gap-4">
                            <div class="flex items-start gap-4">
                                <div
                                    class="size-12 rounded-full bg-primary/10 flex items-center justify-center text-primary shrink-0">
                                    <span class="material-symbols-outlined text-2xl">person</span>
                                </div>
                                <div>
                                    <h1 class="text-lg font-bold text-gray-900 mb-1">${msg.fullName}</h1>
                                    <div class="flex items-center gap-3 text-sm text-gray-500 flex-wrap">
                                        <span class="flex items-center gap-1">
                                            <span class="material-symbols-outlined text-[16px]">mail</span>
                                            ${msg.email}
                                        </span>
                                        <span class="hidden sm:inline w-1 h-1 rounded-full bg-gray-300"></span>
                                        <span class="flex items-center gap-1">
                                            <span class="material-symbols-outlined text-[16px]">schedule</span>
                                            <fmt:formatDate value="${msg.createdAt}" pattern="dd MMM yyyy, HH:mm" />
                                        </span>
                                    </div>
                                </div>
                            </div>

                            <div class="flex items-center gap-2">
                                <c:choose>
                                    <c:when test="${msg.status == 'NEW'}">
                                        <span
                                            class="inline-flex items-center px-3 py-1 rounded-full text-xs font-bold bg-red-100 text-red-800 border border-red-200">NEW</span>
                                    </c:when>
                                    <c:when test="${msg.status == 'READ'}">
                                        <span
                                            class="inline-flex items-center px-3 py-1 rounded-full text-xs font-bold bg-blue-100 text-blue-800 border border-blue-200">READ</span>
                                    </c:when>
                                    <c:when test="${msg.status == 'REPLIED'}">
                                        <span
                                            class="inline-flex items-center px-3 py-1 rounded-full text-xs font-bold bg-green-100 text-green-800 border border-green-200">REPLIED</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span
                                            class="inline-flex items-center px-3 py-1 rounded-full text-xs font-bold bg-gray-100 text-gray-800 border border-gray-200">${msg.status}</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <!-- Subject & Body -->
                        <div class="p-6 md:p-8">
                            <h2 class="text-xl font-bold text-gray-900 mb-6 border-b border-gray-100 pb-4">
                                ${msg.subject}</h2>
                            <div
                                class="prose max-w-none text-gray-700 whitespace-pre-wrap leading-relaxed font-normal bg-gray-50 p-4 rounded-lg border border-gray-100">
                                <c:out value="${msg.message}" />
                            </div>
                        </div>

                        <!-- Actions Footer -->
                        <div class="px-6 py-4 bg-gray-50 border-t border-gray-200 flex justify-end gap-3 flex-wrap">

                            <a href="mailto:${msg.email}?subject=Re: ${msg.subject}" target="_blank"
                                class="inline-flex items-center gap-2 px-4 py-2 bg-white border border-gray-300 rounded-lg text-sm font-medium text-gray-700 shadow-sm hover:bg-gray-50 transition-colors">
                                <span class="material-symbols-outlined text-[20px]">reply</span>
                                Reply via Email
                            </a>

                            <c:if test="${msg.status == 'NEW'}">
                                <form action="${pageContext.request.contextPath}/admin/contacts" method="post"
                                    class="inline">
                                    <input type="hidden" name="id" value="${msg.id}">
                                    <input type="hidden" name="action" value="updateStatus">
                                    <input type="hidden" name="status" value="READ">
                                    <input type="hidden" name="redirect" value="detail">
                                    <button type="submit"
                                        class="inline-flex items-center gap-2 px-4 py-2 bg-blue-600 border border-transparent rounded-lg text-sm font-medium text-white shadow-sm hover:bg-blue-700 transition-colors">
                                        <span class="material-symbols-outlined text-[20px]">mark_email_read</span>
                                        Mark as Read
                                    </button>
                                </form>
                            </c:if>

                            <form action="${pageContext.request.contextPath}/admin/contacts" method="post"
                                class="inline">
                                <input type="hidden" name="id" value="${msg.id}">
                                <input type="hidden" name="action" value="delete">
                                <button type="submit"
                                    onclick="return confirm('Are you sure you want to delete this message?')"
                                    class="inline-flex items-center gap-2 px-4 py-2 bg-white border border-red-200 text-red-700 rounded-lg text-sm font-medium hover:bg-red-50 transition-colors">
                                    <span class="material-symbols-outlined text-[20px]">delete</span>
                                    Delete
                                </button>
                            </form>
                        </div>
                    </div>

                </main>
            </body>

            </html>