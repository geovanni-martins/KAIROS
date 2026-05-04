<%--
  Created by IntelliJ IDEA.
  User: davi
  Date: 03/05/2026
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kairos ? Painel de Moderador</title>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'fundo-geral':     '#0B101E',
                        'fundo-card':      '#161F35',
                        'fundo-hover':     '#1D2B48',
                        'linha-divisoria': '#1D2B48',
                        'marca-kairos':    '#E16144',
                        'texto-padrao':    '#ffffff',
                        'texto-opaco':     '#8494b0',
                        'status-vermelho': '#E16144',
                    },
                    fontFamily: {
                        sora: ['Sora', 'sans-serif'],
                        mono: ['JetBrains Mono', 'monospace']
                    }
                }
            }
        }
    </script>
</head>
<body class="min-h-screen bg-fundo-geral text-texto-padrao font-sora flex flex-col md:flex-row">

<aside class="flex flex-col shrink-0 w-full md:w-[220px] p-4 md:py-7 bg-fundo-card border-b md:border-b-0 md:border-r border-linha-divisoria shadow-lg shadow-black/20">
    <div class="md:px-6 pb-4 md:pb-8 border-b border-linha-divisoria text-marca-kairos font-mono text-xl font-medium tracking-wider flex justify-between items-center">
        <span>KAIROS</span>
        <a href="${pageContext.request.contextPath}/logout" class="md:hidden text-[12px] text-status-vermelho font-semibold">Sair</a>
    </div>

    <%
        com.kairos.model.User usuarioLogado = (com.kairos.model.User) session.getAttribute("user");
        String roleSidebar;
        if (usuarioLogado != null) {
            roleSidebar = usuarioLogado.getRole();
        } else {
            roleSidebar = "";
        }
    %>

    <nav class="flex flex-row md:flex-col overflow-x-auto md:overflow-visible gap-2 md:gap-1 py-4 md:px-3 md:py-5">
        <a href="${pageContext.request.contextPath}/home" class="flex shrink-0 items-center gap-2.5 px-3 py-2.5 rounded-lg text-texto-opaco text-[13px] hover:bg-fundo-hover hover:text-texto-padrao transition-colors duration-150">
            <svg class="w-4 h-4 opacity-70" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><rect x="1" y="1" width="6" height="6" rx="1"/><rect x="9" y="1" width="6" height="6" rx="1"/><rect x="1" y="9" width="6" height="6" rx="1"/><rect x="9" y="9" width="6" height="6" rx="1"/></svg>
            Dashboard
        </a>

        <% if ("moderator".equals(roleSidebar) || "admin".equals(roleSidebar)) { %>
        <a href="${pageContext.request.contextPath}/admin-panel" class="flex shrink-0 items-center gap-2.5 px-3 py-2.5 bg-marca-kairos/15 rounded-lg text-marca-kairos text-[13px] transition-colors duration-150">
            <svg class="w-4 h-4 opacity-70" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M2 4h12M2 8h8M2 12h10"/></svg>
            Painel de Moderador
        </a>
        <% } %>
    </nav>
    <div class="hidden md:block px-3 pt-5 mt-auto border-t border-linha-divisoria">
        <div class="flex items-center gap-2.5 p-2.5 bg-fundo-hover rounded-lg">
            <div class="flex shrink-0 items-center justify-center w-7 h-7 bg-marca-kairos rounded-full text-white text-[11px] font-bold">
                ${user.name.substring(0,1).toUpperCase()}
            </div>
            <div class="flex-1 truncate">
                <p class="text-[12px] font-semibold truncate">${user.name}</p>
                <span class="text-[10px] text-texto-opaco">${user.role}</span>
            </div>
            <a href="${pageContext.request.contextPath}/logout" class="p-1 hover:text-status-vermelho">
                <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
            </a>
        </div>
    </div>
</aside>

<main class="flex-1 p-4 md:p-9 overflow-y-auto flex items-center justify-center">

    <div class="w-full max-w-4xl">
        <header class="mb-10 text-center">
            <p class="text-marca-kairos text-[11px] font-semibold tracking-widest uppercase mb-2">Moderao</p>
            <h1 class="text-[28px] md:text-[32px] font-bold">Painel de Ferramentas</h1>
        </header>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-5 md:gap-6">

            <a href="${pageContext.request.contextPath}/createQuestion" class="group flex flex-col items-center text-center p-8 bg-fundo-card border border-linha-divisoria rounded-2xl shadow-lg transition-all duration-300 hover:-translate-y-2 hover:border-marca-kairos hover:shadow-marca-kairos/10">
                <div class="w-16 h-16 rounded-full bg-marca-kairos/10 flex items-center justify-center text-marca-kairos mb-5 transition-colors duration-300 group-hover:bg-marca-kairos group-hover:text-white">
                    <svg class="w-7 h-7" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M12 8v8M8 12h8"/></svg>
                </div>
                <h2 class="text-texto-padrao text-[16px] font-bold mb-2">Criar Questo</h2>
                <p class="text-texto-opaco text-[12px] leading-relaxed">Adicione novas perguntas de mltipla escolha ao banco de questes</p>
            </a>

            <a href="${pageContext.request.contextPath}/createTopic" class="group flex flex-col items-center text-center p-8 bg-fundo-card border border-linha-divisoria rounded-2xl shadow-lg transition-all duration-300 hover:-translate-y-2 hover:border-marca-kairos hover:shadow-marca-kairos/10">
                <div class="w-16 h-16 rounded-full bg-marca-kairos/10 flex items-center justify-center text-marca-kairos mb-5 transition-colors duration-300 group-hover:bg-marca-kairos group-hover:text-white">
                    <svg class="w-7 h-7" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M4 6h16M4 12h16M4 18h7"/></svg>
                </div>
                <h2 class="text-texto-padrao text-[16px] font-bold mb-2">Criar Tpico</h2>
                <p class="text-texto-opaco text-[12px] leading-relaxed">Gerencie as matrias e assuntos do sistema</p>
            </a>

            <a href="${pageContext.request.contextPath}/reports" class="group flex flex-col items-center text-center p-8 bg-fundo-card border border-linha-divisoria rounded-2xl shadow-lg transition-all duration-300 hover:-translate-y-2 hover:border-marca-kairos hover:shadow-marca-kairos/10">
                <div class="w-16 h-16 rounded-full bg-status-vermelho/10 flex items-center justify-center text-status-vermelho mb-5 transition-colors duration-300 group-hover:bg-status-vermelho group-hover:text-white">
                    <svg class="w-7 h-7" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0zM12 9v4M12 17h.01"/></svg>
                </div>
                <h2 class="text-texto-padrao text-[16px] font-bold mb-2">Ver Reports</h2>
                <p class="text-texto-opaco text-[12px] leading-relaxed">Analise e resolva problemas em questes reportadas pelos alunos</p>
            </a>

        </div>
    </div>
</main>
</body>
</html>