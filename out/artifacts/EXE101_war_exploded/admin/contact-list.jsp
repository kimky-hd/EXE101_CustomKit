<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <!DOCTYPE html>
            <html class="light" lang="en">

            <head>
                <meta charset="utf-8" />
                <meta content="width=device-width, initial-scale=1.0" name="viewport" />
                <title>Customer Mailbox - Admin</title>
                <!-- Fonts -->
                <link href="https://fonts.googleapis.com" rel="preconnect" />
                <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect" />
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap"
                    rel="stylesheet" />
                <link
                    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
                    rel="stylesheet" />
                <!-- Tailwind CSS -->
                <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
                <script id="tailwind-config">
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

                <main class="flex-1 w-full max-w-[1440px] mx-auto p-4 sm:p-6 lg:p-8">

                    <!-- Breadcrumb & Title -->
                    <div class="mb-6">
                        <div class="flex items-center gap-2 text-sm text-gray-500 mb-2">
                            <a href="${pageContext.request.contextPath}/admin/dashboard"
                                class="hover:text-primary">Home</a>
                            <span>/</span>
                            <span class="text-gray-900 font-medium">Customer Mailbox</span>
                        </div>
                        <h1 class="text-2xl font-bold text-gray-900">Hộp thư khách hàng</h1>
                    </div>

                    <!-- Filter Bar (Fiori Style) -->
                    <form action="${pageContext.request.contextPath}/admin/contacts" method="get"
                        class="bg-surface-light rounded-lg shadow-sm border border-gray-200 p-4 mb-6 flex flex-wrap gap-4 items-end">
                        <div class="flex-1 min-w-[200px]">
                            <label class="block text-xs font-medium text-gray-500 mb-1">Status</label>
                            <select name="status"
                                class="block w-full rounded-md border-gray-300 shadow-sm focus:border-primary focus:ring-primary sm:text-sm">
                                <option value="ALL" ${searchStatus=='ALL' ? 'selected' : '' }>All Statuses</option>
                                <option value="NEW" ${searchStatus=='NEW' ? 'selected' : '' }>New</option>
                                <option value="READ" ${searchStatus=='READ' ? 'selected' : '' }>Read</option>
                                <option value="REPLIED" ${searchStatus=='REPLIED' ? 'selected' : '' }>Replied</option>
                            </select>
                        </div>
                        <div class="flex-1 min-w-[150px]">
                            <label class="block text-xs font-medium text-gray-500 mb-1">From Date</label>
                            <input type="date" name="from" value="${searchFrom}"
                                class="block w-full rounded-md border-gray-300 shadow-sm focus:border-primary focus:ring-primary sm:text-sm" />
                        </div>
                        <div class="flex-1 min-w-[150px]">
                            <label class="block text-xs font-medium text-gray-500 mb-1">To Date</label>
                            <input type="date" name="to" value="${searchTo}"
                                class="block w-full rounded-md border-gray-300 shadow-sm focus:border-primary focus:ring-primary sm:text-sm" />
                        </div>
                        <div class="flex gap-2">
                            <a href="${pageContext.request.contextPath}/admin/contacts"
                                class="bg-white border border-gray-300 hover:bg-gray-50 text-gray-700 font-medium py-2 px-4 rounded-md shadow-sm transition-colors text-sm flex items-center justify-center">
                                Reset
                            </a>
                            <button type="submit"
                                class="bg-primary hover:bg-red-700 text-white font-medium py-2 px-4 rounded-md shadow-sm transition-colors text-sm">
                                Filter
                            </button>
                        </div>
                    </form>

                    <!-- Data Table -->
                    <div class="bg-surface-light rounded-lg shadow-sm border border-gray-200 overflow-hidden">
                        <div class="overflow-x-auto">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead class="bg-gray-50">
                                    <tr>
                                        <th scope="col"
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Status</th>
                                        <th scope="col"
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Sender</th>
                                        <th scope="col"
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Subject</th>
                                        <th scope="col"
                                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            Date</th>
                                        <th scope="col" class="relative px-6 py-3"><span class="sr-only">Actions</span>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">
                                    <c:choose>
                                        <c:when test="${not empty messages}">
                                            <c:forEach var="msg" items="${messages}">
                                                <tr class="hover:bg-gray-50 transition-colors">
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <c:choose>
                                                            <c:when test="${msg.status == 'NEW'}">
                                                                <span
                                                                    class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-red-100 text-red-800">NEW</span>
                                                            </c:when>
                                                            <c:when test="${msg.status == 'READ'}">
                                                                <span
                                                                    class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800">READ</span>
                                                            </c:when>
                                                            <c:when test="${msg.status == 'REPLIED'}">
                                                                <span
                                                                    class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">REPLIED</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span
                                                                    class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-gray-100 text-gray-800">${msg.status}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap">
                                                        <div class="text-sm font-medium text-gray-900">${msg.fullName}
                                                        </div>
                                                        <div class="text-xs text-gray-500">${msg.email}</div>
                                                    </td>
                                                    <td class="px-6 py-4">
                                                        <div class="text-sm text-gray-900 line-clamp-1 font-medium">
                                                            ${msg.subject}</div>
                                                        <div class="text-xs text-gray-500 line-clamp-1">${msg.message}
                                                        </div>
                                                    </td>
                                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                                        <fmt:formatDate value="${msg.createdAt}"
                                                            pattern="dd/MM/yyyy HH:mm" />
                                                    </td>
                                                    <td
                                                        class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                                        <form action="${pageContext.request.contextPath}/admin/contacts"
                                                            method="post" class="inline-block">
                                                            <input type="hidden" name="id" value="${msg.id}">
                                                            <input type="hidden" name="action" value="updateStatus">
                                                            <c:if test="${msg.status == 'NEW'}">
                                                                <button type="submit" name="status" value="READ"
                                                                    class="text-blue-600 hover:text-blue-900 mr-3 text-xs font-bold uppercase">Mark
                                                                    Read</button>
                                                            </c:if>
                                                        </form>
                                                        <form action="${pageContext.request.contextPath}/admin/contacts"
                                                            method="post" class="inline-block">
                                                            <input type="hidden" name="id" value="${msg.id}">
                                                            <input type="hidden" name="action" value="delete">
                                                            <button type="submit"
                                                                onclick="return confirm('Are you sure?')"
                                                                class="text-red-600 hover:text-red-900">
                                                                <span
                                                                    class="material-symbols-outlined text-[20px]">delete</span>
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="5" class="px-6 py-10 text-center text-gray-500">
                                                    <span
                                                        class="material-symbols-outlined text-4xl mb-2 text-gray-300">inbox</span>
                                                    <p>No messages found.</p>
                                                </td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </main>
            </body>

            </html>