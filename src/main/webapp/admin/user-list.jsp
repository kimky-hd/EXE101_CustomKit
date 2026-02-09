<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
            <%@ taglib prefix="fn" uri="jakarta.tags.functions" %>


                <c:if test="${empty accounts}">
                    <c:redirect url="/admin/users" />
                </c:if>

                <!DOCTYPE html>
                <html class="light" lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
                    <title>User Management - Admin</title>
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
                        <div class="mb-6 flex justify-between items-end">
                            <div>
                                <div class="flex items-center gap-2 text-sm text-gray-500 mb-2">
                                    <a href="${pageContext.request.contextPath}/admin/dashboard"
                                        class="hover:text-primary">Home</a>
                                    <span>/</span>
                                    <span class="text-gray-900 font-medium">User Management</span>
                                </div>
                                <h1 class="text-2xl font-bold text-gray-900">Quản lý người dùng</h1>
                            </div>
                            <button onclick="openModal('create')"
                                class="bg-primary hover:bg-red-700 text-white font-medium py-2 px-4 rounded-md shadow-sm transition-colors text-sm flex items-center gap-2">
                                <span class="material-symbols-outlined text-[20px]">add</span>
                                Add User
                            </button>
                        </div>
                        <c:if test="${not empty requestScope.errorMessage}">
                            <div class="mb-4 p-4 bg-red-100 border border-red-400 text-red-700 rounded relative"
                                role="alert">
                                <strong class="font-bold">Error!</strong>
                                <span class="block sm:inline">${requestScope.errorMessage}</span>
                            </div>
                        </c:if>
                        <c:if test="${not empty sessionScope.successMessage}">
                            <div class="mb-4 p-4 bg-green-100 border border-green-400 text-green-700 rounded relative"
                                role="alert">
                                <strong class="font-bold">Success!</strong>
                                <span class="block sm:inline">${sessionScope.successMessage}</span>
                                <% session.removeAttribute("successMessage"); %>
                            </div>
                        </c:if>
                        <c:if test="${not empty sessionScope.errorMessage}">
                            <div class="mb-4 p-4 bg-red-100 border border-red-400 text-red-700 rounded relative"
                                role="alert">
                                <strong class="font-bold">Error!</strong>
                                <span class="block sm:inline">${sessionScope.errorMessage}</span>
                                <% session.removeAttribute("errorMessage"); %>
                            </div>
                        </c:if>

                        <!-- Filter Controls -->
                        <div class="bg-white rounded-lg shadow-sm border border-gray-200 p-4 mb-6">
                            <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                                <!-- Search Box -->
                                <div class="md:col-span-1">
                                    <label for="searchInput" class="block text-sm font-medium text-gray-700 mb-2">
                                        <span class="material-symbols-outlined text-[18px] align-middle">search</span>
                                        Search
                                    </label>
                                    <input type="text" id="searchInput" placeholder="Name, email, or phone..."
                                        class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent text-sm">
                                </div>

                                <!-- Role Filter -->
                                <div>
                                    <label for="roleFilter" class="block text-sm font-medium text-gray-700 mb-2">
                                        <span class="material-symbols-outlined text-[18px] align-middle">badge</span>
                                        Role
                                    </label>
                                    <select id="roleFilter"
                                        class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent text-sm">
                                        <option value="">All Roles</option>
                                        <option value="ADMIN">Admin</option>
                                        <option value="USER">User</option>
                                    </select>
                                </div>

                                <!-- Status Filter -->
                                <div>
                                    <label for="statusFilter" class="block text-sm font-medium text-gray-700 mb-2">
                                        <span
                                            class="material-symbols-outlined text-[18px] align-middle">toggle_on</span>
                                        Status
                                    </label>
                                    <select id="statusFilter"
                                        class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary focus:border-transparent text-sm">
                                        <option value="">All Status</option>
                                        <option value="ACTIVE">Active</option>
                                        <option value="INACTIVE">Inactive</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Results Counter -->
                            <div class="mt-3 pt-3 border-t border-gray-200">
                                <p class="text-sm text-gray-600">
                                    Showing <span id="visibleCount" class="font-semibold text-primary">0</span> of
                                    <span id="totalCount" class="font-semibold">0</span> users
                                </p>
                            </div>
                        </div>

                        <!-- Data Table -->
                        <div class="bg-surface-light rounded-lg shadow-sm border border-gray-200 overflow-hidden">
                            <div class="overflow-x-auto">
                                <table class="min-w-full divide-y divide-gray-200">
                                    <thead class="bg-gray-50">
                                        <tr>
                                            <th scope="col"
                                                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                ID</th>
                                            <th scope="col"
                                                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                User Info</th>
                                            <th scope="col"
                                                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                Role</th>
                                            <th scope="col"
                                                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                Status</th>
                                            <th scope="col"
                                                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                Created At</th>
                                            <th scope="col"
                                                class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                Updated At</th>
                                            <th scope="col"
                                                class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">
                                                Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody class="bg-white divide-y divide-gray-200">
                                        <c:choose>
                                            <c:when test="${not empty accounts}">
                                                <c:forEach var="acc" items="${accounts}">
                                                    <tr class="hover:bg-gray-50 transition-colors">
                                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                                            #${acc.id}
                                                        </td>
                                                        <td class="px-6 py-4 whitespace-nowrap">
                                                            <div class="text-sm font-medium text-gray-900">
                                                                ${acc.fullName}
                                                            </div>
                                                            <div class="text-xs text-gray-500">${acc.email}</div>
                                                            <div class="text-xs text-gray-400">${acc.phone != null ?
                                                                acc.phone : 'N/A'}</div>
                                                        </td>
                                                        <td class="px-6 py-4 whitespace-nowrap">
                                                            <span
                                                                class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium 
                                                ${acc.role == 'ADMIN' ? 'bg-purple-100 text-purple-800' : 'bg-gray-100 text-gray-800'}">
                                                                ${acc.role}
                                                            </span>
                                                        </td>
                                                        <td class="px-6 py-4 whitespace-nowrap">
                                                            <span
                                                                class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium
                                                ${acc.status == 'ACTIVE' ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'}">
                                                                ${acc.status}
                                                            </span>
                                                        </td>
                                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                                            <c:choose>
                                                                <c:when test="${acc.createdAt != null}">
                                                                    ${fn:replace(fn:substring(acc.createdAt, 0, 19),
                                                                    'T', ' ')}
                                                                </c:when>
                                                                <c:otherwise>N/A</c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                                                            <c:choose>
                                                                <c:when test="${acc.updatedAt != null}">
                                                                    ${fn:replace(fn:substring(acc.updatedAt, 0, 19),
                                                                    'T', ' ')}
                                                                </c:when>
                                                                <c:otherwise>N/A</c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td
                                                            class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                                            <button
                                                                onclick="openModal('update', ${acc.id}, '${acc.email}', '${acc.fullName}', '${acc.phone}', '${acc.role}', '${acc.status}')"
                                                                class="text-indigo-600 hover:text-indigo-900 mr-2"
                                                                title="Edit">
                                                                <span
                                                                    class="material-symbols-outlined text-[20px]">edit</span>
                                                            </button>
                                                            <form
                                                                action="${pageContext.request.contextPath}/admin/users"
                                                                method="post" class="inline-block"
                                                                onsubmit="return confirm('Are you sure you want to delete this user? This action cannot be undone.');">
                                                                <input type="hidden" name="action" value="delete">
                                                                <input type="hidden" name="id" value="${acc.id}">
                                                                <button type="submit"
                                                                    class="text-red-600 hover:text-red-900"
                                                                    title="Delete">
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
                                                    <td colspan="7" class="px-6 py-10 text-center text-gray-500">
                                                        <span
                                                            class="material-symbols-outlined text-4xl mb-2 text-gray-300">group_off</span>
                                                        <p>No users found.</p>
                                                    </td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </main>

                    <!-- Modal -->
                    <div id="userModal"
                        class="fixed inset-0 z-50 hidden bg-gray-900 bg-opacity-50 flex items-center justify-center p-4 backdrop-blur-sm">
                        <div class="bg-white rounded-lg shadow-xl w-full max-w-md overflow-hidden transform transition-all scale-95 opacity-0"
                            id="modalContent">
                            <div
                                class="bg-gray-50 px-4 py-3 border-b border-gray-200 flex justify-between items-center">
                                <h3 class="text-lg font-medium text-gray-900" id="modalTitle">Add User</h3>
                                <button onclick="closeModal()" class="text-gray-400 hover:text-gray-500">
                                    <span class="material-symbols-outlined">close</span>
                                </button>
                            </div>
                            <form action="${pageContext.request.contextPath}/admin/users" method="post" id="userForm">
                                <input type="hidden" name="action" id="formAction" value="create">
                                <input type="hidden" name="id" id="userId">

                                <div class="px-4 py-4 space-y-4">
                                    <div>
                                        <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                                        <input type="email" name="email" id="email" required
                                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary focus:ring-primary sm:text-sm">
                                    </div>

                                    <div id="passwordField">
                                        <label for="password"
                                            class="block text-sm font-medium text-gray-700">Password</label>
                                        <input type="password" name="password" id="password"
                                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary focus:ring-primary sm:text-sm">
                                        <p class="text-xs text-gray-500 mt-1" id="passwordHelp">Required for new users.
                                        </p>
                                    </div>

                                    <div>
                                        <label for="fullName" class="block text-sm font-medium text-gray-700">Full
                                            Name</label>
                                        <input type="text" name="fullName" id="fullName" required
                                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary focus:ring-primary sm:text-sm">
                                    </div>

                                    <div>
                                        <label for="phone" class="block text-sm font-medium text-gray-700">Phone</label>
                                        <input type="text" name="phone" id="phone"
                                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary focus:ring-primary sm:text-sm">
                                    </div>

                                    <div class="grid grid-cols-2 gap-4">
                                        <div>
                                            <label for="role"
                                                class="block text-sm font-medium text-gray-700">Role</label>
                                            <select name="role" id="role"
                                                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary focus:ring-primary sm:text-sm">
                                                <option value="USER">USER</option>
                                                <option value="ADMIN">ADMIN</option>
                                            </select>
                                        </div>
                                        <div>
                                            <label for="status"
                                                class="block text-sm font-medium text-gray-700">Status</label>
                                            <select name="status" id="status"
                                                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-primary focus:ring-primary sm:text-sm">
                                                <option value="ACTIVE">ACTIVE</option>
                                                <option value="INACTIVE">INACTIVE</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div
                                    class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse border-t border-gray-200">
                                    <button type="submit"
                                        class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-primary text-base font-medium text-white hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary sm:ml-3 sm:w-auto sm:text-sm">
                                        Save
                                    </button>
                                    <button type="button" onclick="closeModal()"
                                        class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm">
                                        Cancel
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <script>
                        function openModal(mode, id, email, fullName, phone, role, status) {
                            const modal = document.getElementById('userModal');
                            const content = document.getElementById('modalContent');
                            const title = document.getElementById('modalTitle');
                            const formAction = document.getElementById('formAction');
                            const passwordField = document.getElementById('passwordField');
                            const passwordInput = document.getElementById('password');

                            modal.classList.remove('hidden');
                            setTimeout(() => {
                                content.classList.remove('scale-95', 'opacity-0');
                                content.classList.add('scale-100', 'opacity-100');
                            }, 10);

                            if (mode === 'create') {
                                title.textContent = 'Add User';
                                formAction.value = 'create';
                                document.getElementById('userForm').reset();
                                document.getElementById('userId').value = '';
                                passwordField.style.display = 'block';
                                passwordInput.required = true;
                                // Defaults
                                document.getElementById('role').value = 'USER';
                                document.getElementById('status').value = 'ACTIVE';
                            } else {
                                title.textContent = 'Edit User';
                                formAction.value = 'update';
                                document.getElementById('userId').value = id;
                                document.getElementById('email').value = email;
                                document.getElementById('email').readOnly = true; // Email usually handled as unique ID, better not change it or handle carefully
                                document.getElementById('email').classList.add('bg-gray-100');
                                document.getElementById('fullName').value = fullName;
                                document.getElementById('phone').value = (phone && phone !== 'null') ? phone : '';
                                document.getElementById('role').value = role;
                                document.getElementById('status').value = status;

                                // Hide password for edit as we don't want to accidentally reset it, or need a separate change password flow
                                passwordField.style.display = 'none';
                                passwordInput.required = false;
                            }
                        }

                        function closeModal() {
                            const modal = document.getElementById('userModal');
                            const content = document.getElementById('modalContent');

                            content.classList.remove('scale-100', 'opacity-100');
                            content.classList.add('scale-95', 'opacity-0');

                            setTimeout(() => {
                                modal.classList.add('hidden');
                            }, 300);
                        }

                        // Close on click outside
                        window.onclick = function (event) {
                            const modal = document.getElementById('userModal');
                            if (event.target == modal) {
                                closeModal();
                            }
                        }

                        // ========== FILTER FUNCTIONALITY ==========
                        function applyFilters() {
                            const searchTerm = document.getElementById('searchInput').value.toLowerCase();
                            const roleFilter = document.getElementById('roleFilter').value;
                            const statusFilter = document.getElementById('statusFilter').value;

                            const rows = document.querySelectorAll('tbody tr');
                            let visibleCount = 0;
                            let totalCount = 0;

                            rows.forEach(row => {
                                // Skip empty state row
                                if (row.querySelector('td[colspan]')) {
                                    return;
                                }

                                totalCount++;

                                // Get row data
                                const cells = row.querySelectorAll('td');
                                const fullName = cells[1]?.querySelector('.text-sm.font-medium')?.textContent.toLowerCase() || '';
                                const email = cells[1]?.querySelector('.text-xs.text-gray-500')?.textContent.toLowerCase() || '';
                                const phone = cells[1]?.querySelectorAll('.text-xs')[1]?.textContent.toLowerCase() || '';
                                const role = cells[2]?.textContent.trim() || '';
                                const status = cells[3]?.textContent.trim() || '';

                                // Apply filters
                                const matchesSearch = !searchTerm ||
                                    fullName.includes(searchTerm) ||
                                    email.includes(searchTerm) ||
                                    phone.includes(searchTerm);

                                const matchesRole = !roleFilter || role === roleFilter;
                                const matchesStatus = !statusFilter || status === statusFilter;

                                // Show/hide row
                                if (matchesSearch && matchesRole && matchesStatus) {
                                    row.style.display = '';
                                    visibleCount++;
                                } else {
                                    row.style.display = 'none';
                                }
                            });

                            // Update counter
                            document.getElementById('visibleCount').textContent = visibleCount;
                            document.getElementById('totalCount').textContent = totalCount;
                        }

                        // Attach event listeners
                        document.addEventListener('DOMContentLoaded', function () {
                            document.getElementById('searchInput').addEventListener('input', applyFilters);
                            document.getElementById('roleFilter').addEventListener('change', applyFilters);
                            document.getElementById('statusFilter').addEventListener('change', applyFilters);

                            // Initialize counter
                            applyFilters();
                        });
                    </script>
                </body>

                </html>