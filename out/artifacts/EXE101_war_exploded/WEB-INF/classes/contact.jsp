<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html class="light" lang="vi">

        <head>
            <meta charset="utf-8" />
            <meta content="width=device-width, initial-scale=1.0" name="viewport" />
            <title>Kiss Kit - Liên hệ</title>
            <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
            <link href="https://fonts.googleapis.com/css2?family=Epilogue:wght@400;500;700;900&amp;display=swap"
                rel="stylesheet" />
            <link
                href="https://fonts.googleapis.com/css2?family=Spline+Sans:wght@300;400;500;600;700&amp;family=Gochi+Hand&amp;display=swap"
                rel="stylesheet" />
            <link
                href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
                rel="stylesheet" />
            <script id="tailwind-config">
                tailwind.config = {
                    darkMode: "class",
                    theme: {
                        extend: {
                            colors: {
                                "primary": "#d7193f",
                                "background-light": "#f8f6f6",
                                "background-dark": "#211114",
                                "doodle-black": "#1b0e10",
                                "kraft-brown": "#D2B48C",
                            },
                            fontFamily: {
                                "display": ["Spline Sans", "Epilogue", "sans-serif"],
                                "handwritten": ["Gochi Hand", "cursive"]
                            },
                            boxShadow: {
                                'hard': '4px 4px 0px 0px #1b0e10',
                                'hard-lg': '8px 8px 0px 0px #1b0e10',
                            }
                        },
                    },
                }
            </script>
            <style>
                .scribble-bg {
                    background-image: radial-gradient(#d7193f33 1px, transparent 1px);
                    background-size: 20px 20px;
                }

                .hand-drawn-border {
                    border: 3px solid #1b0e10;
                    border-radius: 255px 15px 225px 15px/15px 225px 15px 255px;
                }

                /* Custom scrollbar to match aesthetic */
                ::-webkit-scrollbar {
                    width: 10px
                }

                ::-webkit-scrollbar-track {
                    background: #f1f1f1
                }

                ::-webkit-scrollbar-thumb {
                    background: #d7193f;
                    border-radius: 10px
                }
            </style>
        </head>

        <body class="bg-background-light dark:bg-background-dark font-display text-doodle-black dark:text-white">
            <div class="relative flex min-h-screen w-full flex-col overflow-x-hidden pt-24 md:pt-28">
                <jsp:include page="common/header.jsp" />

                <!-- Main Content -->
                <main class="flex-1 w-full max-w-[1200px] mx-auto px-6 lg:px-20 py-12 relative scribble-bg">

                    <!-- Background Elements -->
                    <div class="absolute inset-0 z-0 opacity-10 pointer-events-none overflow-hidden">
                        <!-- Paint Splash Top Left -->
                        <svg class="absolute -top-10 -left-10 w-64 h-64 text-primary rotate-12" fill="currentColor"
                            viewbox="0 0 200 200">
                            <path
                                d="M45.7,35.3C28.2,55.9,7.4,81.4,13.8,109.8c6.6,29.3,42.7,46.1,70.9,50.4c31.1,4.7,64.9-7.1,86.2-30.8c20.3-22.6,25.2-56.7,13.6-84.3C172.4,17.1,139.7,2.2,109.8,7.9C81.6,13.3,64.2,13.5,45.7,35.3z">
                            </path>
                        </svg>
                    </div>

                    <div class="relative z-10 grid grid-cols-1 lg:grid-cols-2 gap-16 items-start">
                        <!-- Column 1: Info -->
                        <div class="flex flex-col gap-8 lg:pr-10">
                            <div class="relative">
                                <h1
                                    class="text-5xl lg:text-6xl font-black tracking-tighter uppercase italic mb-4 relative inline-block">
                                    Liên hệ <br />
                                    <span class="text-primary relative inline-block transform rotate-1">
                                        Xưởng vẽ
                                        <svg class="absolute -bottom-2 left-0 w-full h-4 text-doodle-black/20"
                                            preserveaspectratio="none" viewbox="0 0 100 10">
                                            <path d="M0 5 Q 25 0, 50 5 T 100 5" fill="none" stroke="currentColor"
                                                stroke-width="4"></path>
                                        </svg>
                                    </span>
                                </h1>
                                <p class="text-lg opacity-80 font-medium leading-relaxed max-w-md">
                                    Bạn có ý tưởng điên rồ? Muốn đặt workshop riêng? Hay đơn giản là muốn ghé chơi?
                                    Chúng
                                    mình luôn ở đây!
                                </p>
                            </div>

                            <div class="space-y-6 mt-4">
                                <!-- Address -->
                                <div class="flex items-center gap-5 group">
                                    <div
                                        class="size-12 flex items-center justify-center rounded-full border-2 border-doodle-black bg-white dark:bg-background-dark shadow-hard group-hover:bg-primary/10 transition-colors">
                                        <span class="material-symbols-outlined text-primary text-2xl">location_on</span>
                                    </div>
                                    <div>
                                        <p class="text-sm uppercase tracking-wider font-bold opacity-60 mb-1">Địa chỉ
                                        </p>
                                        <p class="text-xl font-medium">123 Phố Sáng Tạo, Quận Art</p>
                                    </div>
                                </div>
                                <!-- Phone -->
                                <div class="flex items-center gap-5 group">
                                    <div
                                        class="size-12 flex items-center justify-center rounded-full border-2 border-doodle-black bg-white dark:bg-background-dark shadow-hard group-hover:bg-primary/10 transition-colors">
                                        <span class="material-symbols-outlined text-primary text-2xl">call</span>
                                    </div>
                                    <div>
                                        <p class="text-sm uppercase tracking-wider font-bold opacity-60 mb-1">Hotline
                                        </p>
                                        <p class="text-xl font-medium">0987 654 321</p>
                                    </div>
                                </div>
                                <!-- Email -->
                                <div class="flex items-center gap-5 group">
                                    <div
                                        class="size-12 flex items-center justify-center rounded-full border-2 border-doodle-black bg-white dark:bg-background-dark shadow-hard group-hover:bg-primary/10 transition-colors">
                                        <span class="material-symbols-outlined text-primary text-2xl">mail</span>
                                    </div>
                                    <div>
                                        <p class="text-sm uppercase tracking-wider font-bold opacity-60 mb-1">Email</p>
                                        <p class="text-xl font-medium">hello@kisskit.vn</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Socials -->
                            <div class="pt-6 border-t-2 border-dashed border-doodle-black/20">
                                <p class="text-sm font-bold opacity-60 mb-4">Theo dõi chúng mình:</p>
                                <div class="flex gap-4">
                                    <a class="size-10 flex items-center justify-center rounded-full border-2 border-doodle-black hover:bg-primary hover:text-white transition-all transform hover:-translate-y-1"
                                        href="#">
                                        <span class="font-bold text-xs">IG</span>
                                    </a>
                                    <a class="size-10 flex items-center justify-center rounded-full border-2 border-doodle-black hover:bg-primary hover:text-white transition-all transform hover:-translate-y-1"
                                        href="#">
                                        <span class="font-bold text-xs">FB</span>
                                    </a>
                                    <a class="size-10 flex items-center justify-center rounded-full border-2 border-doodle-black hover:bg-primary hover:text-white transition-all transform hover:-translate-y-1"
                                        href="#">
                                        <span class="font-bold text-xs">TK</span>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <!-- Column 2: Form -->
                        <div class="relative mt-8 lg:mt-0">
                            <!-- Tape effect -->
                            <div
                                class="absolute -top-4 left-1/2 -translate-x-1/2 w-32 h-10 bg-[#f0e68c] opacity-90 z-20 transform -rotate-2 shadow-sm pointer-events-none border border-doodle-black/10">
                            </div>

                            <div
                                class="relative bg-white dark:bg-[#1a1a1a] p-8 md:p-10 hand-drawn-border shadow-hard transform rotate-1 transition-transform hover:rotate-0 duration-500">
                                <h2
                                    class="text-3xl font-black mb-8 text-primary flex items-center gap-2 uppercase italic">
                                    <span class="material-symbols-outlined text-4xl">edit_note</span>
                                    Nhắn gửi yêu thương
                                </h2>

                                <%-- Success Message --%>
                                    <% if (session.getAttribute("contactSuccess") !=null) { %>
                                        <div
                                            class="mb-6 px-4 py-3 rounded-lg border-2 border-green-600 bg-green-50 text-green-700 font-bold flex items-center gap-2">
                                            <span class="material-symbols-outlined">check_circle</span>
                                            ${sessionScope.contactSuccess}
                                        </div>
                                        <% session.removeAttribute("contactSuccess"); %>
                                            <% } %>

                                                <%-- Error Message --%>
                                                    <% if (session.getAttribute("contactError") !=null) { %>
                                                        <div
                                                            class="mb-6 px-4 py-3 rounded-lg border-2 border-red-600 bg-red-50 text-red-700 font-bold flex items-center gap-2">
                                                            <span class="material-symbols-outlined">error</span>
                                                            ${sessionScope.contactError}
                                                        </div>
                                                        <% } %>

                                                            <form action="<%=request.getContextPath()%>/contact"
                                                                method="POST" class="space-y-6">
                                                                <div class="space-y-1">
                                                                    <label
                                                                        class="block text-sm font-bold uppercase tracking-wider ml-1"
                                                                        for="name">Họ tên</label>
                                                                    <input
                                                                        class="w-full rounded-xl border-4 border-doodle-black bg-background-light dark:bg-background-dark p-4 focus:ring-0 focus:border-primary transition-all font-medium placeholder:text-gray-400"
                                                                        id="name" name="name" type="text"
                                                                        placeholder="Tên của bạn..."
                                                                        value="<c:out value='${not empty sessionScope.contactName ? sessionScope.contactName : sessionScope.currentUser.fullName}' default=''/>" />
                                                                </div>

                                                                <div class="space-y-1">
                                                                    <label
                                                                        class="block text-sm font-bold uppercase tracking-wider ml-1"
                                                                        for="email">Email</label>
                                                                    <input
                                                                        class="w-full rounded-xl border-4 border-doodle-black bg-background-light dark:bg-background-dark p-4 focus:ring-0 focus:border-primary transition-all font-medium placeholder:text-gray-400"
                                                                        id="email" name="email" type="email"
                                                                        placeholder="email@cuaban.com"
                                                                        value="<c:out value='${not empty sessionScope.contactEmail ? sessionScope.contactEmail : sessionScope.currentUser.email}' default=''/>" />
                                                                </div>

                                                                <div class="space-y-1">
                                                                    <label
                                                                        class="block text-sm font-bold uppercase tracking-wider ml-1"
                                                                        for="subject">Chủ đề</label>
                                                                    <div class="relative">
                                                                        <select
                                                                            class="w-full rounded-xl border-4 border-doodle-black bg-background-light dark:bg-background-dark p-4 focus:ring-0 focus:border-primary transition-all font-medium appearance-none cursor-pointer"
                                                                            id="subject" name="subject">
                                                                            <option value="General"
                                                                                ${sessionScope.contactSubject=='General'
                                                                                ? 'selected' : '' }>Hỏi đáp chung
                                                                            </option>
                                                                            <option value="Workshop"
                                                                                ${sessionScope.contactSubject=='Workshop'
                                                                                ? 'selected' : '' }>Đặt lịch Workshop
                                                                            </option>
                                                                            <option value="Order"
                                                                                ${sessionScope.contactSubject=='Order'
                                                                                ? 'selected' : '' }>Vấn đề đơn hàng
                                                                            </option>
                                                                            <option value="Collab"
                                                                                ${sessionScope.contactSubject=='Collab'
                                                                                ? 'selected' : '' }>Hợp tác</option>
                                                                        </select>
                                                                        <div
                                                                            class="absolute right-4 top-1/2 -translate-y-1/2 pointer-events-none text-primary">
                                                                            <span
                                                                                class="material-symbols-outlined">expand_more</span>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="space-y-1">
                                                                    <label
                                                                        class="block text-sm font-bold uppercase tracking-wider ml-1"
                                                                        for="message">Lời nhắn</label>
                                                                    <textarea
                                                                        class="w-full rounded-xl border-4 border-doodle-black bg-background-light dark:bg-background-dark p-4 focus:ring-0 focus:border-primary transition-all font-medium placeholder:text-gray-400 resize-none"
                                                                        id="message" name="message" rows="4"
                                                                        placeholder="Bạn muốn nhắn gì với chúng mình?">${not empty sessionScope.contactMessage ? sessionScope.contactMessage : ''}</textarea>
                                                                </div>

                                                                <button type="submit"
                                                                    class="group relative w-full mt-4 h-14 bg-primary text-white font-black text-lg rounded-xl shadow-hard hover:shadow-none hover:translate-x-1 hover:translate-y-1 transition-all">
                                                                    <span
                                                                        class="flex items-center justify-center gap-2 uppercase tracking-wide">
                                                                        Gửi đi nào
                                                                        <span
                                                                            class="material-symbols-outlined group-hover:scale-110 transition-transform">favorite</span>
                                                                    </span>
                                                                </button>
                                                            </form>
                            </div>
                        </div>
                    </div>
                </main>

                <jsp:include page="common/footer.jsp" />
            </div>

            <!-- Re-use Logout Modal from Header -->
        </body>

        </html>