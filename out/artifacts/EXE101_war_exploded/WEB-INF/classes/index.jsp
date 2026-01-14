<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html class="light" lang="vi"><head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link href="https://fonts.googleapis.com/css2?family=Epilogue:wght@400;500;700;900&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Spline+Sans:wght@300;400;500;600;700&amp;family=Gochi+Hand&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
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
                    borderRadius: {
                        "DEFAULT": "0.25rem",
                        "lg": "0.5rem",
                        "xl": "0.75rem",
                        "full": "9999px"
                    },
                    boxShadow: {
                        'hard': '4px 4px 0px 0px #1b0e10',
                        'hard-lg': '8px 8px 0px 0px #1b0e10',
                    }
                },
            },
        }
    </script>
    <link href="css/style.css" rel="stylesheet"/>
</head>
<body class="bg-background-light dark:bg-background-dark font-display text-doodle-black dark:text-white">
<div class="relative flex min-h-screen w-full flex-col overflow-x-hidden pt-24 md:pt-28">
    <jsp:include page="common/header.jsp" />
    <!-- Hero Section -->
    <main class="flex-1 flex flex-col items-center justify-center px-6 lg:px-20 py-12 relative">
        <!-- Background Elements -->
        <div class="absolute inset-0 z-0 opacity-10 pointer-events-none overflow-hidden">
            <div class="absolute top-20 left-10 rotate-12 bg-primary w-24 h-24 rounded-full blur-3xl"></div>
            <div class="absolute bottom-20 right-10 -rotate-12 bg-kraft-brown w-32 h-32 rounded-full blur-3xl"></div>
        </div>
        <div class="layout-content-container flex flex-col max-w-[1200px] w-full z-10">
            <div class="grid grid-cols-1 lg:grid-cols-12 gap-12 items-center">
                <!-- Content Column -->
                <div class="lg:col-span-7 flex flex-col gap-8 text-left order-2 lg:order-1">
                    <div class="inline-block self-start bg-kraft-brown text-doodle-black px-3 py-1 font-bold text-xs uppercase tracking-widest rounded rotate-[-2deg] shadow-hard">
                        🔥 Trending trên TikTok
                    </div>
                    <h1 class="text-5xl md:text-7xl font-black leading-[0.9] tracking-tighter uppercase italic">
                        CUSTOM ÁO <br/>
                        <span class="text-primary relative inline-block">
                                NỤ HUN
                                <svg class="absolute -bottom-2 left-0 w-full h-4 text-doodle-black/20" preserveaspectratio="none" viewbox="0 0 100 10">
<path d="M0 5 Q 25 0, 50 5 T 100 5" fill="none" stroke="currentColor" stroke-width="4"></path>
</svg>
</span>
                    </h1>
                    <p class="text-xl md:text-2xl font-medium max-w-[500px] leading-snug">
                        Gói trọn yêu thương, Tự tay làm quà. Bộ kit DIY đầy đủ từ màu vẽ chuyên dụng đến cọ tinh xảo.
                    </p>
                    <div class="flex flex-wrap gap-4 mt-4">
                        <button class="bg-primary text-white text-xl font-black px-10 py-5 rounded-xl shadow-hard-lg hover:translate-x-1 hover:translate-y-1 hover:shadow-hard transition-all uppercase tracking-tight group flex items-center gap-3">
                            <span>MUA NGAY KẺO LỠ TREND</span>
                            <span class="material-symbols-outlined group-hover:translate-x-2 transition-transform">arrow_forward</span>
                        </button>
                        <div class="flex items-center gap-2 px-4 py-2 border-2 border-dashed border-doodle-black rounded-lg bg-white/50 dark:bg-background-dark/50">
                            <span class="material-symbols-outlined text-green-600">check_circle</span>
                            <span class="font-bold text-sm">Còn 12 bộ trong kho</span>
                        </div>
                    </div>
                    <!-- Mini Feature List -->
                    <div class="grid grid-cols-3 gap-4 pt-8">
                        <div class="flex flex-col gap-1">
                            <span class="font-black text-primary text-lg">01. Vẽ</span>
                            <p class="text-xs font-bold opacity-70">Màu acrylic cao cấp</p>
                        </div>
                        <div class="flex flex-col gap-1">
                            <span class="font-black text-primary text-lg">02. Tặng</span>
                            <p class="text-xs font-bold opacity-70">Hộp Kraft vintage</p>
                        </div>
                        <div class="flex flex-col gap-1">
                            <span class="font-black text-primary text-lg">03. Yêu</span>
                            <p class="text-xs font-bold opacity-70">Kỷ niệm độc bản</p>
                        </div>
                    </div>
                </div>
                <!-- Visual Column (Flatlay) -->
                <div class="lg:col-span-5 relative order-1 lg:order-2">
                    <div class="relative w-full aspect-square md:aspect-[4/5] bg-white dark:bg-background-dark p-4 doodle-border shadow-hard-lg rotate-[2deg] overflow-hidden">
                        <div class="absolute inset-0 paper-texture opacity-30"></div>
                        <div class="w-full h-full bg-cover bg-center rounded-lg" data-alt="Flatlay of Kiss Kit with paints, brushes, and kiss marks on white fabric" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuAchs-wqvMU6P-LEsacWCP2lTZcwcpKgl22WiEr56IqeR4J_vvJytEMZW_yvwJfbl4P-oXaw7NWSPyJN_Vyu6c0EfgC-F9Hdq6UbSxZ8UpmzDqRER2gkJ7uKU7_-eqjofdqytcxiTC9UHE1-GTPPVmB7NG4Yl1nFAu5aDnceZdgBckEw-vrE3BM4iydZJa7HEyaPBZjwCLVnOlhhGeb_WYZpmvb9psc06t1Uuz0hzPqc9ZZdnJI3UMilUfGfip8MaiDXD8iwsL1cSI");'>
                        </div>
                        <!-- Floating Stickers -->
                        <div class="absolute -top-6 -right-6 w-24 h-24 bg-yellow-400 rounded-full flex items-center justify-center border-2 border-doodle-black rotate-12 shadow-hard animate-bounce">
                            <span class="font-black text-center leading-none text-sm">GIÁ SỐC<br/>-30%</span>
                        </div>
                        <div class="absolute bottom-10 -left-10 bg-white px-4 py-2 border-2 border-doodle-black shadow-hard -rotate-6">
                            <div class="flex items-center gap-2">
                                <div class="flex -space-x-2">
                                    <div class="w-6 h-6 rounded-full bg-red-400 border border-white"></div>
                                    <div class="w-6 h-6 rounded-full bg-blue-400 border border-white"></div>
                                    <div class="w-6 h-6 rounded-full bg-green-400 border border-white"></div>
                                </div>
                                <span class="text-[10px] font-black italic">+5k Đã mua</span>
                            </div>
                        </div>
                    </div>
                    <!-- Mascot Doodle -->
                    <div class="absolute -bottom-8 -right-8 w-32 h-32 z-20 transition-transform hover:scale-110 cursor-pointer">
                        <div class="relative">
                            <!-- Placeholder for the doodle cat mascot -->
                            <div class="w-full h-full p-2 bg-white rounded-xl border-2 border-doodle-black shadow-hard rotate-[-10deg]">
                                <div class="w-full h-full bg-contain bg-no-repeat bg-center" data-alt="Cute doodle cat mascot holding a tiny paintbrush" style="background-image: url('https://lh3.googleusercontent.com/aida-public/AB6AXuD-rbZLiDaMKd7T1tBeLsrDwe9nwniFhPGOAoyOcF3XksbUcDte7ZGT7QxjeKTHThCG9ktCIKKv_7GiC-CVR2P7cgLTDntbGUGpgHtMZaMNmKhH9xzKxEwPPLDU23IYb0PXVIOZDCAT5Mx2zmQOphsvc4McebqWrr2litbGuSI7Ax-awl7eJfJ-Chx0Uu_XCvia5njrHKHr62T9j4ywV3WaghRyOsPZYqTefEQfoTra40p9VDML_ENx37bLChWMt84OQtRtcA0IMwY');">
                                </div>
                            </div>
                            <div class="absolute -top-4 -left-4 bg-primary text-white text-[10px] font-bold px-2 py-1 rounded-full border border-doodle-black">Hế lô!</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- Feature Grid (Paper Layout) -->
    <section class="px-6 lg:px-20 py-20 bg-kraft-brown/10 border-t-2 border-doodle-black">
        <div class="max-w-[1200px] mx-auto">
            <div class="flex flex-col md:flex-row justify-between items-end mb-12 gap-6">
                <div>
                    <h2 class="text-4xl font-black italic uppercase tracking-tighter">TỪNG CHI TIẾT TRONG KISSKIT GIÚP BẠN VẼ TỐT HƠN</h2>
                    <p class="font-bold opacity-60">Everything you need for a perfect handmade gift.</p>
                </div>
                <button class="border-b-4 border-primary font-black hover:text-primary transition-all">XEM CHI TIẾT BỘ KIT</button>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                <!-- Feature 1 -->
                <div class="bg-white dark:bg-background-dark p-6 doodle-border shadow-hard hover:-translate-y-2 transition-transform">
                    <div class="w-full aspect-video bg-cover bg-center rounded mb-4 doodle-border" data-alt="Vibrant acrylic paints in small tubes" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDzRACCwnllGNX62zIzqZRpJ2S6vuxJJ-Hpr6eSLylkmWvPFW3t2aIXuNZnQ1xL86hdJxX_kAyAL2FjXGA0lxooDiwFI951og380x8LYbvwdXV6MGtneeObaok2Nk2vNzbkXzznZjTROtPIuzZMVUqlz4L9ExQxGPGVnygIl44Cden8Z7rj89JOu1VJWOfcwR4qEybiENonTwrvzs9593RT1yTF_nOhyHPxbvs0idHZLzLlezRk_SsQazVOe9J1yXEKuj5M3cYkKV4");'></div>
                    <h3 class="font-black text-xl mb-2 italic">Màu vẽ chuyên dụng</h3>
                    <p class="text-sm font-medium opacity-80 leading-relaxed">Màu acrylic bền màu, không phai, tuyệt đối an toàn cho làn da nhạy cảm.</p>
                </div>
                <!-- Feature 2 -->
                <div class="bg-white dark:bg-background-dark p-6 doodle-border shadow-hard hover:-translate-y-2 transition-transform rotate-1">
                    <div class="w-full aspect-video bg-cover bg-center rounded mb-4 doodle-border" data-alt="Set of high quality paint brushes" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuBS0pUIEUad8axRaiYBUZB968hXwJ7ZsFkueq7O_RLWWCk-q7DjjOEwGqifXsevDpOOkSqydGRrF2fH95YBCFXnm-nwgWijkX8GFTmds9JXeEfjJrejKw-7JCwWzsCdmxS_PKmLhbIK5Ct_aAU3YxJV9kwxczx2p53RITHntMGzyJxCim_AkqErRn2moJSkD4YDwpvurBk8DntD96oThj9rMSZyK4_gWNqU74bCiMRpb-v5izEKJR0rAArBlA4a-NanIoP9QqBjK_Y");'></div>
                    <h3 class="font-black text-xl mb-2 italic">Bộ cọ cao cấp</h3>
                    <p class="text-sm font-medium opacity-80 leading-relaxed">Đa dạng kích thước đầu cọ, giúp bạn đi những nét vẽ tinh xảo nhất.</p>
                </div>
                <!-- Feature 3 -->
                <div class="bg-white dark:bg-background-dark p-6 doodle-border shadow-hard hover:-translate-y-2 transition-transform -rotate-1">
                    <div class="w-full aspect-video bg-cover bg-center rounded mb-4 doodle-border" data-alt="Washi tape and masking tools" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuC4ZZy5Jsx8NBaLqUxhWkAlh4IdjsIqzRYG7-6aAMkzffHZvB2bNiC5wI9ZuAA5BjDf5FOqIgD0BdbHC8eGJUFuMNbiJi4hdwr6rbeJFJ42YHnLJ_17_4r-8YjCl0szsy8rx9KcbPf3YO7bQiXbpBJZhxSYPch5kBo29fXRPSrgSa7GZAy1k2Ad8RHAJVojrasYH02qsKmLfnj764Irsdco87PoW_u3ixsT80uSGqpUG0AJLu4QMjRE3ddh4D4ViMezhkobAQnebos");'></div>
                    <h3 class="font-black text-xl mb-2 italic">Băng keo định hình</h3>
                    <p class="text-sm font-medium opacity-80 leading-relaxed">Tạo hình nụ hôn hoặc họa tiết vuông vức cực dễ dàng, không lem màu.</p>
                </div>
                <!-- Feature 4 -->
                <div class="bg-white dark:bg-background-dark p-6 doodle-border shadow-hard hover:-translate-y-2 transition-transform">
                    <div class="w-full aspect-video bg-cover bg-center rounded mb-4 doodle-border" data-alt="Eco-friendly Kraft gift box design" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuC7U5FE1tYiDISw-u5Hx4-jUf1trehDZVDRGc6ouiqG9ABOt2SY0tRQQzqne8jruzQCQYQvWndhkzwkhG2s3OgcMlAC4RcVg57BhVbbu9uOnK_mrNxftdEOEwhK4A9GrE2WbZeSyxLjlBQKxp8B-ILs3Cl-33PmKtczihMYJgq8jS7qsQ09ik60Qoeod69bJAd7LssW19dTccHRNMvJOsg9v2wv211_NQO7D-VoJsioHLn33VxjRTzBQT8frD14ZMwsYnm6OrDbZUc");'></div>
                    <h3 class="font-black text-xl mb-2 italic">Hộp quà Kraft</h3>
                    <p class="text-sm font-medium opacity-80 leading-relaxed">Thiết kế vintage mộc mạc, sẵn sàng để trao gửi mà không cần gói lại.</p>
                </div>
            </div>
        </div>
    </section>
    <section class="bg-background-light dark:bg-background-dark">
        <div class="px-6 md:px-20 pt-16 pb-8 text-center max-w-[1200px] mx-auto">
            <span class="bg-yellow-300 text-doodle-black px-4 py-1 font-black uppercase text-sm comic-border sticker-rotate-left inline-block mb-4">
                The Essentials
            </span>
            <h1 class="text-4xl md:text-7xl font-black uppercase tracking-tight mb-6 leading-[0.9]">
                CÓ GÌ TRONG <span class="text-primary italic">KISS KIT?</span>
            </h1>
            <p class="text-lg md:text-xl font-medium max-w-2xl mx-auto opacity-80">
                Everything you need to turn your boring basics into wearable art. Hand-picked materials for the Gen Z soul.
            </p>
        </div>
        <div class="px-6 md:px-20 py-12 max-w-[1200px] mx-auto overflow-hidden">
            <div class="grid grid-cols-1 md:grid-cols-12 gap-8 md:gap-4 relative">
                <div class="md:col-span-5 md:rotate-[-1deg] transition-transform hover:rotate-0">
                    <div class="comic-border bg-white dark:bg-zinc-900 p-6 flex flex-col gap-4 relative comic-border-hover h-full">
                        <div class="w-full aspect-square bg-zinc-100 rounded-lg overflow-hidden border-2 border-doodle-black">
                            <div class="w-full h-full bg-center bg-cover" data-alt="Close up of Mont Marte Crimson Red acrylic paint tube" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuAW-5vjtcH71mYZUlVGO5fRDi_Cw9rCGd8voXutEmSeNKtHyclEUOZ5xdyXxXPc_r4YL4sNe9Kf2YvcBPifVQVBpNHoYlcY6Th1PvIrs56_tcNMe6G_w_bREd-j4Uh5liY87Qad37up3oiIjDhEkHPevndIFZjKQ73WwgtSCSUQDHdghTQ_hgSd6IKWP3IhGFFVEbOWY-BjVbWttAk18UM-8PyxkZ8X69R85h-VcLukAiXMlAaTkB8UFKAWtGvPBMnM3v3TH2liKIU");'></div>
                        </div>
                        <div class="absolute -top-4 -right-4 bg-primary text-white px-3 py-1 font-bold text-xs comic-border sticker-rotate-right">
                            HOT SHADE
                        </div>
                        <div class="mt-2">
                            <h3 class="text-2xl font-black uppercase text-primary">Đỏ chuẩn son Crimson</h3>
                            <p class="text-sm font-bold opacity-60 mt-1 uppercase tracking-wider">Mont Marte Acrylic Paint</p>
                            <div class="doodle-line w-full my-4"></div>
                            <p class="text-sm">Siêu pigmented, bám vải cực đỉnh. Một tông đỏ cực cháy không thể thiếu cho các artist.</p>
                        </div>
                    </div>
                </div>
                <div class="md:col-span-7 md:mt-12 md:rotate-[1deg] transition-transform hover:rotate-0">
                    <div class="comic-border bg-[#fff9f0] dark:bg-zinc-800 p-6 flex flex-col md:flex-row gap-6 comic-border-hover h-full relative">
                        <div class="w-full md:w-1/2 aspect-square bg-zinc-200 rounded-lg overflow-hidden border-2 border-doodle-black shrink-0">
                            <div class="w-full h-full bg-center bg-cover" data-alt="Set of three high quality artist brushes" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuBCVrjiLFCPY2vQk05cpRFPTGOHjI9tMt3kPlWtbF4it3i9QNOfr0GwOLOwAd2vHmlXB1APobI1dLw7vB-7w8PKgMyrJEQ5Tl44Y0ygiBX2bYGgOR-NXFPbqnaJEuxrbGy_bNY3J6GaR7sxilDPG58mm0sailXEeVFgQZJYenbIGaoIyHuLnc4QytRy3G8stcZ6UQbhkSeosspMl5YSd2LFE1ghP-Rx10ARn3qI-8eDnDTn1gTuet9KR5sc0s1G4V0pc4kaL0o3rUg");'></div>
                        </div>
                        <div class="flex flex-col justify-center">
                            <h3 class="text-2xl font-black uppercase leading-tight">Bộ 3 cọ thần thánh</h3>
                            <p class="text-sm font-bold opacity-60 mt-1 uppercase tracking-wider">Set of 3 essential brushes</p>
                            <div class="doodle-line w-full my-4"></div>
                            <ul class="text-sm space-y-2">
                                <li class="flex items-center gap-2"><span class="material-symbols-outlined text-sm font-bold">check_circle</span> Fine tip for details</li>
                                <li class="flex items-center gap-2"><span class="material-symbols-outlined text-sm font-bold">check_circle</span> Flat brush for fill</li>
                                <li class="flex items-center gap-2"><span class="material-symbols-outlined text-sm font-bold">check_circle</span> Angled for precision</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="md:col-span-6 md:-mt-4 md:rotate-[0.5deg] transition-transform hover:rotate-0">
                    <div class="comic-border bg-white dark:bg-zinc-900 p-6 flex flex-col gap-4 comic-border-hover h-full">
                        <div class="w-full aspect-video bg-zinc-100 rounded-lg overflow-hidden border-2 border-doodle-black">
                            <div class="w-full h-full bg-center bg-cover" data-alt="A small jar of acrylic medium solvent" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuAtxLnTHrrt2Ff4amcqARiTS5XeugzOOPXELRSASEnFKD8kq3CqYlwVH4ZcYf75WYMgM_u4PGm8ZPLv9LHLcwRdze0HwE3MYdZwD3oW0_zbHyDWySUkiX_Rzdxd3n2LUn4XsgLEjeASaakcOopPBfssa_t7oSzp_FABcnLOSoGbVO2cue-y0D7wRlBiW1-o2W9AEDSeP_EmoHBqGQdAPmwKzeymtibVHBWwGwvI7soWg771ImaSYv0llLJ9hHi1k7ZFsQm6rjNGa2g");'></div>
                        </div>
                        <div class="mt-2">
                            <h3 class="text-2xl font-black uppercase">Vũ khí bí mật: Khoá màu</h3>
                            <p class="text-sm font-bold opacity-60 mt-1 uppercase tracking-wider">The Medium/Solvent Jar</p>
                            <div class="doodle-line w-full my-4"></div>
                            <p class="text-sm">Lớp bảo vệ vô hình giúp thiết kế của bạn bền bỉ qua hàng chục lần giặt. Không bay màu, không nứt nẻ.</p>
                        </div>
                    </div>
                </div>
                <div class="md:col-span-6 md:rotate-[-2deg] transition-transform hover:rotate-0">
                    <div class="comic-border bg-blue-50 dark:bg-zinc-800 p-6 flex flex-col gap-4 comic-border-hover h-full relative">
                        <div class="absolute top-4 left-4 bg-doodle-black text-white px-2 py-0.5 text-[10px] font-bold uppercase rounded">
                            Pro Tool
                        </div>
                        <div class="w-full aspect-video bg-zinc-200 rounded-lg overflow-hidden border-2 border-doodle-black">
                            <div class="w-full h-full bg-center bg-cover" data-alt="A roll of blue painter's masking tape" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuCmZEhdBu-fFQvNB73SJqd-WEMlpD6hpvTRra5GM9XBtaFYFwlqn5hgdJMyp9KxbSZzbB7DdAkWHFRKshpOGiqp1MXlzP6350nJOObIc0ALCpnTfMirCU5k4lGnRmfWY7b6Syy6y015js32l47PWKUP14AMMjwFOReLJnn-VY0-WuaqY-FmAZW64kgWsxedM9nIrmJD9X73fWm0EknM5wVbxdqaeEg83lsYcuHyeZeQZUn4JlBFPhQRHedp8x5D_isJv8_T-1VcKJ8");'></div>
                        </div>
                        <div class="mt-2">
                            <h3 class="text-2xl font-black uppercase">Vạch rõ ranh giới</h3>
                            <p class="text-sm font-bold opacity-60 mt-1 uppercase tracking-wider">Fox Tape for precision</p>
                            <div class="doodle-line w-full my-4"></div>
                            <p class="text-sm">Băng dính chuyên dụng không để lại keo. Giúp bạn tạo những đường nét sắc sảo như dân chuyên.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section class="px-6 md:px-20 py-20 bg-doodle-black text-white mt-12">
            <div class="max-w-[1200px] mx-auto grid grid-cols-1 md:grid-cols-3 gap-12">
                <div class="flex flex-col gap-4 border-l-4 border-primary pl-6">
                    <span class="material-symbols-outlined text-4xl text-primary">draw</span>
                    <h4 class="text-xl font-black uppercase">Hand-Drawn Style</h4>
                    <p class="text-zinc-400">Playful doodle borders and rounded modern fonts like Epilogue.</p>
                </div>
                <div class="flex flex-col gap-4 border-l-4 border-primary pl-6">
                    <span class="material-symbols-outlined text-4xl text-primary">star</span>
                    <h4 class="text-xl font-black uppercase">Gen Z Aesthetic</h4>
                    <p class="text-zinc-400">Designed for the trendsetters and DIY lovers. Pure artistic freedom.</p>
                </div>
                <div class="flex flex-col gap-4 border-l-4 border-primary pl-6">
                    <span class="material-symbols-outlined text-4xl text-primary">verified</span>
                    <h4 class="text-xl font-black uppercase">Pro-Quality Tools</h4>
                    <p class="text-zinc-400">Only the best materials like Mont Marte and Fox Tape. No cheap fillers.</p>
                </div>
            </div>
        </section>
        <section class="px-6 md:px-20 py-24 text-center">
            <div class="max-w-[800px] mx-auto bg-white dark:bg-zinc-900 comic-border p-12 relative overflow-hidden">
                <div class="absolute top-0 right-0 w-32 h-32 bg-primary/10 rounded-full -mr-16 -mt-16"></div>
                <h2 class="text-3xl md:text-5xl font-black uppercase tracking-tight mb-6">
                    Ready to start your DIY journey?
                </h2>
                <p class="text-lg font-medium opacity-80 mb-10">
                    Get your Kiss Kit today and create your unique fashion statement. Free shipping on your first kit!
                </p>
                <div class="flex flex-wrap justify-center gap-4">
                    <button class="comic-border bg-primary text-white px-8 py-4 text-lg font-black uppercase comic-border-hover min-w-[200px]">
                        Shop Now
                    </button>
                    <button class="comic-border bg-white text-doodle-black px-8 py-4 text-lg font-black uppercase comic-border-hover min-w-[200px]">
                        View Tutorial
                    </button>
                </div>
                <div class="mt-12 flex justify-center opacity-40">
                    <span class="material-symbols-outlined text-6xl">brush</span>
                    <span class="material-symbols-outlined text-6xl">palette</span>
                    <span class="material-symbols-outlined text-6xl">auto_fix_high</span>
                </div>
            </div>
        </section>
        <section
                class="bg-primary/5 px-6 md:px-20 py-16 flex flex-col items-center">
            <div class="relative inline-block tilt-left mb-8">
                <div class="absolute -top-4 -left-6 text-primary">
                    <span class="material-symbols-outlined !text-4xl">edit_note</span>
                </div>
                <h1 class="bg-white dark:bg-background-dark border-4 border-doodle-black p-6 text-4xl md:text-6xl font-black uppercase tracking-tighter hard-shadow text-center max-w-3xl leading-[0.9]">
                    3 Bước Để Có Chiếc Áo <span class="text-primary italic">Dính Nụ Hôn</span>
                </h1>
                <div class="absolute -bottom-6 -right-8">
                    <svg class="fill-current text-doodle-black dark:text-white" height="80" viewBox="0 0 100 100" width="80">
                        <path d="M20,50 Q20,20 50,20 T80,50 T50,80 T20,50" fill="none" stroke="currentColor" stroke-dasharray="5,5" stroke-width="2"></path>
                        <text font-family="Epilogue" font-size="10" font-weight="bold" x="25" y="55">DIY MODE</text>
                    </svg>
                </div>
            </div>
        </section>
        <section class="bg-primary/5 px-6 md:px-20 pb-24">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-12 relative">
                <div class="hidden md:block absolute top-1/2 left-[30%] -translate-y-1/2 z-0 opacity-30">
                    <span class="material-symbols-outlined !text-6xl text-primary">trending_flat</span>
                </div>
                <div class="hidden md:block absolute top-1/2 left-[64%] -translate-y-1/2 z-0 opacity-30">
                    <span class="material-symbols-outlined !text-6xl text-primary">trending_flat</span>
                </div>
                <div class="group relative bg-white dark:bg-[#2d1a1d] border-4 border-doodle-black p-4 hard-shadow tilt-right flex flex-col gap-4 z-10 transition-transform hover:-translate-y-2">
                    <div class="absolute -top-5 -left-5 bg-primary text-white w-12 h-12 flex items-center justify-center font-black text-2xl border-4 border-doodle-black rounded-full z-20">1</div>
                    <div class="overflow-hidden border-2 border-doodle-black">
                        <div class="w-full aspect-square bg-center bg-cover transition-transform group-hover:scale-105" data-alt="Close up of masking tape applied on white fabric creating a square frame" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuAPP6idyRW07CTrs1j-gcby6PknWrBgNDWjvOiMR-_Lc1fgULwTfCUjY6x0vGqHpqNRVfXbTTUl1eifxv-B7tr3ouT-Nvi3P8nqIGpHyEokqSG9rv4I95LaIIqmoWKRVdMMAT25BuQw5p7kFywyOLgdRlpgGonNgkCPiDw3P2CYzC0jzF23ThjBTpImeaiJXC5piJG5oTbs86MwTNnwI12aGFHQ1pUKa3F6OqViX4GeqF7r6LmfP-XBC0iZIFtIE36Vvuevq7iSDY8");'></div>
                    </div>
                    <div class="space-y-2 relative">
                        <h3 class="text-xl font-black uppercase tracking-tight">Dán khung định hình</h3>
                        <p class="text-sm font-medium opacity-80 leading-snug">Dùng băng keo tạo khung nụ hôn hoàn hảo. Keep it clean!</p>
                        <p class="text-primary font-bold text-xs tracking-widest uppercase italic">Step 1: Tape Mask</p>
                        <div class="absolute -bottom-2 -right-2 translate-x-4">
                            <span class="material-symbols-outlined !text-4xl text-doodle-black dark:text-white">pets</span>
                        </div>
                    </div>
                </div>
                <div class="group relative bg-white dark:bg-[#2d1a1d] border-4 border-doodle-black p-4 hard-shadow tilt-left flex flex-col gap-4 z-10 transition-transform hover:-translate-y-2">
                    <div class="absolute -top-5 -left-5 bg-primary text-white w-12 h-12 flex items-center justify-center font-black text-2xl border-4 border-doodle-black rounded-full z-20">2</div>
                    <div class="overflow-hidden border-2 border-doodle-black">
                        <div class="w-full aspect-square bg-center bg-cover transition-transform group-hover:scale-105" data-alt="Vibrant red acrylic paint being squeezed from a tube onto a palette" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDgpcC-e9Zu1U9r4hsaVvZ93se0EoDsrXSroUEm2lXVBN_UfNnZW4QKJEo3E4cv1FSZnDHM6I_SNpVwSglQw86AbzJQ2sg3dETpzy--287POtMZhXvgfRFkUf-wurz_jJxSXscgZ5MmHI0C3UZOtXCvDgb10IepSisSkPMkCEEyTVZMEmzyb69A4LggqyrBC5GbSCh-Tmi1nKSbNP0lONqJwewQqpFXIQ-KbQyX1tPvrwQZbo9V9ppTC_Ml92Y5EqJ71AJpk5QRUKI");'></div>
                    </div>
                    <div class="space-y-2 relative">
                        <h3 class="text-xl font-black uppercase tracking-tight">Pha màu yêu thích</h3>
                        <p class="text-sm font-medium opacity-80 leading-snug">Mix màu đỏ rực rỡ từ bộ kit hoặc sáng tạo tone riêng.</p>
                        <p class="text-primary font-bold text-xs tracking-widest uppercase italic">Step 2: Mix Paint</p>
                        <div class="absolute -bottom-2 -right-2 translate-x-4 scale-x-[-1]">
                            <span class="material-symbols-outlined !text-4xl text-doodle-black dark:text-white">brush</span>
                        </div>
                    </div>
                </div>
                <div class="group relative bg-white dark:bg-[#2d1a1d] border-4 border-doodle-black p-4 hard-shadow tilt-right flex flex-col gap-4 z-10 transition-transform hover:-translate-y-2">
                    <div class="absolute -top-5 -left-5 bg-primary text-white w-12 h-12 flex items-center justify-center font-black text-2xl border-4 border-doodle-black rounded-full z-20">3</div>
                    <div class="overflow-hidden border-2 border-doodle-black">
                        <div class="w-full aspect-square bg-center bg-cover transition-transform group-hover:scale-105" data-alt="Finished red kiss lip print on a white t-shirt with glossy finish" style='background-image: url("https://lh3.googleusercontent.com/aida-public/AB6AXuDCjAQWGq_aBmLl9bQtd01IzVnwumtSSd4FKgc9LaeZJ6ZtFjTYiHn0Dt6DlEPEAgAmixOAkbBaTb_c10AOSImF47Cr30DZQp4HJgLEeYJhsCQP0zm5ejqBqrfUsUe4pjRM8cvhpmcVZpSZUPI0yYCNbR-kSzUe3v63HRO3mmgoRYcIVJUES1sj0OrsZRs-0yE2VeunI78UcSNjW1ULgsHqprA4K6jot8JBNQCVo9_b1mYgbka4ySYAV1wNsl-2Q011ZsVvBwEtmWQ");'></div>
                    </div>
                    <div class="space-y-2 relative">
                        <h3 class="text-xl font-black uppercase tracking-tight">Ấn môi &amp; Phủ bóng</h3>
                        <p class="text-sm font-medium opacity-80 leading-snug">Hoàn thiện tác phẩm của riêng bạn. Xịt bóng để giữ màu lâu.</p>
                        <p class="text-primary font-bold text-xs tracking-widest uppercase italic">Step 3: Print &amp; Glaze</p>
                        <div class="absolute -top-12 -right-4">
                            <span class="material-symbols-outlined !text-5xl text-primary">celebration</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- CTA Section -->
        <section class="bg-primary px-6 md:px-20 py-20 text-white overflow-hidden relative border-y-8 border-[#1b0e10]">
            <div class="max-w-4xl mx-auto flex flex-col md:flex-row items-center justify-between gap-10 relative z-10">
                <div class="text-center md:text-left">
                    <h2 class="text-4xl md:text-5xl font-black uppercase leading-none tracking-tighter mb-4">
                        Sẵn sàng tạo nên <br/>nụ hôn của riêng bạn?
                    </h2>
                    <p class="text-lg font-bold opacity-90 italic">Sở hữu ngay bộ Kiss Kit và bắt đầu sáng tạo!</p>
                </div>
                <div class="shrink-0">
                    <button class="bg-white text-primary border-4 border-[#1b0e10] px-10 py-5 text-xl font-black uppercase tracking-widest hard-shadow hover:translate-x-1 hover:translate-y-1 hover:shadow-none transition-all">
                        Mua Ngay
                    </button>
                </div>
            </div>
            <!-- Decorative background kiss symbols -->
            <div class="absolute top-0 right-0 opacity-10 pointer-events-none transform translate-x-1/4 -translate-y-1/4">
                <span class="material-symbols-outlined !text-[300px]">favorite</span>
            </div>
        </section>
    </section>
    <main class="flex-1 max-w-[1200px] mx-auto w-full px-6 py-12">
        <!-- Section Title -->
        <div class="text-center mb-16 relative">
                <span
                        class="inline-block px-4 py-1 bg-yellow-300 text-black text-xs font-bold rounded-full sticker-rotate-left absolute -top-4 left-1/4">TRENDING
                    NOW</span>
            <h1 class="text-4xl md:text-5xl font-bold mb-4">Our Kiss Kit Fam</h1>
            <p class="text-lg text-gray-600 dark:text-gray-400 font-handwritten">The crew rocking their custom kiss
                shirts! 💋✨</p>
            <div class="absolute -right-8 top-0 hidden lg:block">
                <span class="material-symbols-outlined text-primary text-6xl opacity-20">history_edu</span>
            </div>
        </div>
        <!-- Masonry Gallery -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 items-start">
            <!-- Polaroid Card 1 -->
            <div
                    class="bg-white dark:bg-zinc-800 p-4 shadow-xl card-tilt-1 border-b-[12px] border-white dark:border-zinc-800 rounded-sm relative group">
                <div class="relative overflow-hidden aspect-square rounded-sm mb-4">
                    <img class="w-full h-full object-cover"
                         data-alt="Couple wearing custom kiss mark white t-shirts smiling"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuCYwTL2KZGz0XElXffJlY2aucYuEzBKSE4YdunVy8C591qcuQkNQokW-zO59fyeB9D0L0GXvkbwzWrpS4gua3Czq64Mt98UgZrUx_HgrkaRJIOnKK2P5TCsvYu8lEMbRbeJGz5QSkY9jiFq6sJcybeZnTpAHSqAI9Db6rdla3gO6LQjpszgath4OXEbeIT__yy2FHk2aoVHuesDj0w1wM_YGRDMv-8DZO_aEEz8Pxvw6SPeK5LRk45ohhxALGKz1OLkaDvq8ILvFbA" />
                    <div
                            class="absolute top-2 right-2 bg-pink-500 text-white px-3 py-1 text-xs font-bold rounded-full sticker-rotate-right shadow-lg">
                        Xinh xỉu</div>
                </div>
                <div class="px-2">
                    <p class="font-handwritten text-xl leading-tight mb-3">Best date night activity ever! We're
                        literally obsessed. 💋</p>
                    <div class="flex items-center justify-between border-t border-dashed border-gray-200 pt-3">
                        <span class="text-xs font-bold text-gray-400">@maya_and_j</span>
                        <div class="flex items-center gap-2 text-primary">
                            <span class="material-symbols-outlined text-sm">favorite</span>
                            <span class="text-xs font-bold">1.2k</span>
                        </div>
                    </div>
                </div>
                <div
                        class="absolute -bottom-4 -right-4 w-12 h-12 bg-primary rounded-full flex items-center justify-center text-white rotate-12 shadow-lg opacity-0 group-hover:opacity-100 transition-opacity">
                    <span class="material-symbols-outlined">celebration</span>
                </div>
            </div>
            <!-- Polaroid Card 2 -->
            <div
                    class="bg-white dark:bg-zinc-800 p-4 shadow-xl card-tilt-2 border-b-[12px] border-white dark:border-zinc-800 rounded-sm relative mt-12 md:mt-0">
                <div class="relative overflow-hidden aspect-[4/5] rounded-sm mb-4">
                    <img class="w-full h-full object-cover"
                         data-alt="Group of girl friends laughing in customized kiss hoodies"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuC4A0N0N9wUQSeZy5iIgJdXS7ZeA1FyPVBAjU5brQIHYoeg43aT95towMLKVT1E_y3A3OOeJQDT0NYYD3NmuXkOsYG5KBWW2fBBSQn6H_Ko45ig00n7G60RCYg7TPBTYblm_n-K1MQObC5gIz-FTw34eFGWgizETnGHF7UXg834LdPiA53flKmMfkmRNkoaNBmMZWA2xprH8acpqdkgg5X-5mBwsr6JG-gvJ9PK5XpINDwTY4-1RVkipFduNo9VVm8BnVZgflMWXUk" />
                    <div
                            class="absolute bottom-4 left-4 bg-yellow-400 text-black px-3 py-1 text-xs font-bold rounded-sm sticker-rotate-left shadow-lg">
                        Keo lì</div>
                    <div class="absolute top-4 left-4">
                            <span
                                    class="material-symbols-outlined text-primary fill-1 text-4xl drop-shadow-md">favorite</span>
                    </div>
                </div>
                <div class="px-2">
                    <p class="font-handwritten text-xl leading-tight mb-3">Matching with the besties for our road
                        trip! 10/10 vibes.</p>
                    <div class="flex items-center justify-between border-t border-dashed border-gray-200 pt-3">
                        <span class="text-xs font-bold text-gray-400">@the_squad_official</span>
                        <div class="flex items-center gap-2 text-primary">
                            <span class="material-symbols-outlined text-sm">favorite</span>
                            <span class="text-xs font-bold">856</span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Polaroid Card 3 -->
            <div
                    class="bg-white dark:bg-zinc-800 p-4 shadow-xl card-tilt-3 border-b-[12px] border-white dark:border-zinc-800 rounded-sm relative lg:mt-24">
                <div class="relative overflow-hidden aspect-square rounded-sm mb-4">
                    <img class="w-full h-full object-cover"
                         data-alt="Close up of a kiss mark on a white collar shirt"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuBR2wpAIWkvQvNBGVqB63rYSmWsosD1-A_rToqlyIIXYP_2UNaVgdxE3-I3zlQ_FWyB2Gn6JX0fV-_uTPMTcb9GiLDA_Lb_qq5jiGXcQE7_B541nULDikLPkR4BoGgrZeTBxEC0GusdpMpPsdA82AIRfcYXt6clWEhiEJJQXN2TDFXv0DwaaZ4fG339Qu2dE9a5gQ2Izk4EEJ4q3kRlOuVfc81JEuCEOcTWmpAEUB07XVHSqjzjvuZ03DVrNoFwmjkPSyRG6peweUs" />
                    <div
                            class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 bg-blue-500 text-white px-4 py-2 text-sm font-bold rounded-lg sticker-rotate-right shadow-xl border-2 border-white">
                        10 ĐIỂM</div>
                </div>
                <div class="px-2">
                    <p class="font-handwritten text-xl leading-tight mb-3">No but actually, the quality is insane.
                        10 điểm không có nhưng!</p>
                    <div class="flex items-center justify-between border-t border-dashed border-gray-200 pt-3">
                        <span class="text-xs font-bold text-gray-400">@alex_vibe</span>
                        <div class="flex items-center gap-2 text-primary">
                            <span class="material-symbols-outlined text-sm">favorite</span>
                            <span class="text-xs font-bold">2.4k</span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Polaroid Card 4 -->
            <div
                    class="bg-white dark:bg-zinc-800 p-4 shadow-xl card-tilt-2 border-b-[12px] border-white dark:border-zinc-800 rounded-sm relative lg:-mt-12">
                <div class="relative overflow-hidden aspect-[3/4] rounded-sm mb-4">
                    <img class="w-full h-full object-cover"
                         data-alt="Single person posing with a customized kiss tote bag"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuBAEj1WLa7RW47PBprTdXe09u82s50UgF6y0etd8RA0TiI9W3jLJeimIQ6MS0SC3Yl6m7pOL88pW0cuEYtXn6w7--rAqhHxkOPNAcwt_mipAP3ZZ8coFKd3ddH7MpldwIoncPXePwkhfNnpYBubYrQXQ6Tpl9hU79dqekDYd4DAcmpQToxDT8AYFoomqZVFTPh158-FFMSdrVddYSaBgi1F_OT3UbodvUx-Tw8qJlagUtniODLn7xKQPUSeb79uSNN1WNFteBkGMRw" />
                    <div class="absolute top-4 right-4 text-primary bg-white/40 backdrop-blur rounded-full p-1">
                        <span class="material-symbols-outlined fill-1">verified</span>
                    </div>
                </div>
                <div class="px-2">
                    <p class="font-handwritten text-xl leading-tight mb-3">Cutest anniversary gift idea. He loved it
                        so much! 🥹❤️</p>
                    <div class="flex items-center justify-between border-t border-dashed border-gray-200 pt-3">
                        <span class="text-xs font-bold text-gray-400">@jenny_p</span>
                        <div class="flex items-center gap-2 text-primary">
                            <span class="material-symbols-outlined text-sm">favorite</span>
                            <span class="text-xs font-bold">542</span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Polaroid Card 5 - Add Your Own (CTA) -->
            <div
                    class="bg-primary/5 dark:bg-primary/10 border-4 border-dashed border-primary/30 p-8 shadow-sm card-tilt-1 rounded-lg flex flex-col items-center justify-center min-h-[400px] text-center mt-8">
                <div
                        class="size-20 bg-primary text-white rounded-full flex items-center justify-center mb-6 shadow-lg animate-bounce">
                    <span class="material-symbols-outlined text-4xl">add_a_photo</span>
                </div>
                <h3 class="text-2xl font-bold mb-2">Be Our Next Star!</h3>
                <p class="text-sm text-gray-600 dark:text-gray-300 mb-6">Upload your look and get featured in our
                    hall of fame</p>
                <button
                        class="bg-white text-primary px-8 py-3 rounded-xl font-bold border-2 border-primary hover:bg-primary hover:text-white transition-all">
                    Upload Look
                </button>
                <div class="mt-8 flex gap-2">
                    <span class="material-symbols-outlined text-primary/40">auto_awesome</span>
                    <span class="material-symbols-outlined text-primary/40">brush</span>
                    <span class="material-symbols-outlined text-primary/40">palette</span>
                </div>
            </div>
            <!-- Polaroid Card 6 -->
            <div
                    class="bg-white dark:bg-zinc-800 p-4 shadow-xl card-tilt-3 border-b-[12px] border-white dark:border-zinc-800 rounded-sm relative lg:mt-8">
                <div class="relative overflow-hidden aspect-square rounded-sm mb-4">
                    <img class="w-full h-full object-cover"
                         data-alt="Friends outdoor in sunlight wearing kiss tshirts"
                         src="https://lh3.googleusercontent.com/aida-public/AB6AXuAAP6NgppQ9Xv8HEhWWV4CupXg47uSkp7QulJFkXC3hMxWRPiOu92XQlDJ7bPG-45ksXgjr77OwYsW2mcVbJnKjKiZlsG_3KnmBLtiBSVfCc7cwcaIs0-G5EpnHWjKHLBt8QLUZbE2J_DodNzcIqsxBROlDoCNInJa3IHilQdxfIaLdTSmxHUj5GZx5AyD4XFw89rkrckgtsJQTNpVFJWTaxvy8gvibTOwby5C8J5hGcSGEcg-NvOddunZ-ewgbuLBEb4tThSm5APA" />
                    <div
                            class="absolute bottom-2 right-2 bg-green-500 text-white px-3 py-1 text-[10px] font-bold rounded-full shadow-lg">
                        AUTHENTIC VIBES</div>
                </div>
                <div class="px-2">
                    <p class="font-handwritten text-xl leading-tight mb-3">Literally cannot stop wearing this. It's
                        my personality now.</p>
                    <div class="flex items-center justify-between border-t border-dashed border-gray-200 pt-3">
                        <span class="text-xs font-bold text-gray-400">@vibe_check_01</span>
                        <div class="flex items-center gap-2 text-primary">
                            <span class="material-symbols-outlined text-sm">favorite</span>
                            <span class="text-xs font-bold">1.8k</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Reaction Bar / Social Proof -->
        <div class="mt-24 flex flex-col items-center text-center">
            <div class="flex flex-wrap justify-center gap-12 mb-8">
                <div class="flex flex-col items-center">
                    <div class="bg-primary/10 p-4 rounded-full mb-3">
                            <span
                                    class="material-symbols-outlined text-3xl text-primary">sentiment_very_satisfied</span>
                    </div>
                    <p class="text-2xl font-bold">5,000+</p>
                    <p class="text-sm text-gray-500">Happy Couples</p>
                </div>
                <div class="flex flex-col items-center">
                    <div class="bg-primary/10 p-4 rounded-full mb-3">
                        <span class="material-symbols-outlined text-3xl text-primary">stars</span>
                    </div>
                    <p class="text-2xl font-bold">4.9/5</p>
                    <p class="text-sm text-gray-500">Avg. Rating</p>
                </div>
                <div class="flex flex-col items-center">
                    <div class="bg-primary/10 p-4 rounded-full mb-3">
                        <span class="material-symbols-outlined text-3xl text-primary">share</span>
                    </div>
                    <p class="text-2xl font-bold">15k</p>
                    <p class="text-sm text-gray-500">Social Mentions</p>
                </div>
            </div>
            <div class="flex gap-2">
                <img class="w-8 h-8 opacity-20" data-alt="Red kiss mark icon"
                     src="https://lh3.googleusercontent.com/aida-public/AB6AXuDPOQbsK9XFhFQAxlkdvW-i-mFa7uq_NdhoFDyI898_-gmSr-u9l6au8vWMglLm68NoLo6CBqR8Lcioe514AhAkzFMiGv8qaGfhUEUPv3uKOxsVvFzs6RHxFHcnBsu3-kzx5lQEDAl9xEJixh6E1Rl6fFoEddakbkDvVJ4TwhcDGJIw2Dk_MZGdJrDy8gsWdiJcnpg8SwUwY-xJxOdPEnJoMBIZ2NU5SnA9uC_9iMJiJErNsw0WzUX_V-mJ3hJTdX8lTuPdofGxuhk" />
                <img class="w-8 h-8 opacity-40" data-alt="Red kiss mark icon"
                     src="https://lh3.googleusercontent.com/aida-public/AB6AXuDXIW2z-TNeEWhWaThFSSGf72i3D-b4EZxqorrWIP9tWRrgJ7A7sizcH_MIfdG1sR9-s3j0rc1wahTBeQfzGd6riGwd7rvS91bGX2VDhziK8MlrpEhqP5YNfUGT7IJcumxZ7uiRpbZ_2nyFEhOGEdtNbHeJ7MXmABrquenrBknqtqKDvANfgKhQUpD-zK8fA-bdYVA1IlvCXvo_M_3Jn2SjyQbsbWWMtiFDV2AKki8UXcfW2fFF1ipbeG5zeMt8nVi19-IdeXCSLK4" />
                <img class="w-8 h-8 opacity-20" data-alt="Red kiss mark icon"
                     src="https://lh3.googleusercontent.com/aida-public/AB6AXuCYELps9_pbYHgHc3v210V1lYLh4q5vXN7iOa6qOTQw4Ru3QrBQ2sRWSLGL0gwswECL0Nz2UNJj7HHeNXkqohRxsmf2hP4-oPYcpqpY0Woab59_Si9cJlIZ-Rbt1KWD5jGeB5qhGcW4G181xMxIZB9jC3ALs4gnylLo28UVkisXOjQjKWYJguWPYta3GR0nfFXxE6UB_61uDMovshWIYrqvfuUljKxClJUvgrTl_3HkdfnAoKHPtg3fNE0b0Eyzx8BQezXXalM7TgY" />
            </div>
        </div>
    </main>

    <jsp:include page="common/footer.jsp" />
</div>
</body></html>
