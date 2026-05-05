<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<button onclick="toggleSidebar()" class="absolute top-4 left-4 z-40 p-2 bg-fundo-card border border-linha-divisoria rounded-lg text-texto-opaco hover:text-marca-kairos transition-colors shadow-md cursor-pointer">
    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2">
        <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16"></path>
    </svg>
</button>

<div id="sidebar-overlay" onclick="toggleSidebar()" class="fixed inset-0 bg-black/50 z-40 hidden transition-opacity duration-300 cursor-pointer"></div>

<aside id="sidebar" class="fixed top-0 left-0 z-50 flex flex-col w-[260px] h-screen p-5 bg-fundo-card border-r border-linha-divisoria shadow-2xl shadow-black/50 transform -translate-x-full transition-transform duration-300 ease-in-out font-sora">

    <div class="px-2 pb-6 border-b border-linha-divisoria flex justify-between items-center">
        <span class="text-marca-kairos font-mono text-xl font-medium tracking-wider">KAIROS</span>
        <button onclick="toggleSidebar()" class="text-texto-opaco hover:text-status-vermelho transition-colors cursor-pointer p-1">
            <svg class="w-5 h-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"></path></svg>
        </button>
    </div>

    <%
        com.kairos.model.User usuarioLogado = (com.kairos.model.User) session.getAttribute("user");
        String roleSidebar;
        if (usuarioLogado != null) {
            roleSidebar = usuarioLogado.getRole();
        } else {
            roleSidebar = "";
        }

        String uri = request.getRequestURI();

        String activeClasses = "bg-marca-kairos/15 text-marca-kairos font-semibold";
        String inactiveClasses = "text-texto-opaco font-medium hover:bg-fundo-hover hover:text-texto-padrao";

        String classHome = inactiveClasses;
        String classQuestions = inactiveClasses;
        String classTopics = inactiveClasses;
        String classAdmin = inactiveClasses;
        String classMod = inactiveClasses;

        if (uri != null) {
            if (uri.contains("home")) { classHome = activeClasses; }
            if (uri.contains("questions")) { classQuestions = activeClasses; }
            if (uri.contains("topics")) { classTopics = activeClasses; }

            if (uri.contains("admin-panel") || uri.contains("adminPanel")) {
                classAdmin = activeClasses;
            }

            if (uri.contains("moderator-panel") || uri.contains("moderatorPanel") || uri.contains("createQuestion") || uri.contains("createTopic") || uri.contains("reports")) {
                classMod = activeClasses;
            }
        }
    %>

    <nav class="flex flex-col gap-2 py-6 overflow-y-auto">

        <a href="${pageContext.request.contextPath}/home" class="flex items-center gap-3 px-3 py-3 rounded-xl text-[13px] transition-colors duration-200 <%= classHome %>">
            <svg class="w-4 h-4 opacity-80" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><rect x="1" y="1" width="6" height="6" rx="1"/><rect x="9" y="1" width="6" height="6" rx="1"/><rect x="1" y="9" width="6" height="6" rx="1"/><rect x="9" y="9" width="6" height="6" rx="1"/></svg>
            Dashboard
        </a>

        <% if ("student".equals(roleSidebar)) { %>
        <a href="${pageContext.request.contextPath}/questions" class="flex items-center gap-3 px-3 py-3 rounded-xl text-[13px] transition-colors duration-200 <%= classQuestions %>">
            <svg class="w-4 h-4 opacity-70" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><circle cx="8" cy="8" r="6"/><path d="M8 5v3l2 2"/></svg>
            Questões
        </a>
        <a href="${pageContext.request.contextPath}/topics" class="flex items-center gap-3 px-3 py-3 rounded-xl text-[13px] transition-colors duration-200 <%= classTopics %>">
            <svg class="w-4 h-4 opacity-70" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M2 4h12M2 8h8M2 12h10"/></svg>
            Tópicos
        </a>

        <a href="#" class="flex items-center gap-3 px-3 py-3 rounded-xl text-[13px] text-texto-opaco font-medium transition-colors duration-200 hover:bg-fundo-hover hover:text-texto-padrao">
            <svg class="w-4 h-4 opacity-70" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M8 1l2 4 5 .7-3.5 3.4.8 5L8 12l-4.3 2.1.8-5L1 5.7 6 5z"/></svg>
            Lacunas
        </a>
        <% } %>

        <% if ("admin".equals(roleSidebar)) { %>
        <a href="${pageContext.request.contextPath}/admin-panel" class="flex items-center gap-3 px-3 py-3 rounded-xl text-[13px] transition-colors duration-200 <%= classAdmin %>">
            <svg class="w-4 h-4 opacity-70" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M2 4h12M2 8h8M2 12h10"/></svg>
            Painel do Administrador
        </a>
        <% } %>

        <% if ("moderator".equals(roleSidebar)) { %>
        <a href="${pageContext.request.contextPath}/moderator-panel" class="flex items-center gap-3 px-3 py-3 rounded-xl text-[13px] transition-colors duration-200 <%= classMod %>">
            <svg class="w-4 h-4 opacity-70" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M2 4h12M2 8h8M2 12h10"/></svg>
            Painel do Moderador
        </a>
        <% } %>

        <a href="#" class="flex items-center gap-3 px-3 py-3 mt-2 border-t border-linha-divisoria rounded-xl text-[13px] text-texto-opaco font-medium transition-colors duration-200 hover:bg-fundo-hover hover:text-texto-padrao">
            <svg class="w-4 h-4 opacity-70" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"/></svg>
            Configurações
        </a>
    </nav>

    <div class="pt-5 mt-auto border-t border-linha-divisoria">
        <div class="flex items-center gap-3 p-3 bg-fundo-hover rounded-xl">
            <div class="flex shrink-0 items-center justify-center w-8 h-8 bg-marca-kairos rounded-full text-white text-[12px] font-bold">
                ${user.name.substring(0,1).toUpperCase()}
            </div>
            <div class="flex-1 truncate">
                <p class="text-[13px] text-texto-padrao font-semibold truncate">${user.name}</p>
                <span class="text-[11px] text-texto-opaco capitalize">${user.role}</span>
            </div>
            <a href="${pageContext.request.contextPath}/logout" class="p-1.5 text-texto-opaco hover:text-status-vermelho transition-colors cursor-pointer" title="Sair">
                <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
            </a>
        </div>
    </div>
</aside>

<script>
    function toggleSidebar() {
        const sidebar = document.getElementById("sidebar");
        const overlay = document.getElementById("sidebar-overlay");

        sidebar.classList.toggle("-translate-x-full");
        overlay.classList.toggle("hidden");
    }
</script>