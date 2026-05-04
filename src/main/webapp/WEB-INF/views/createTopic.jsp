<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.kairos.model.Topic, java.util.List" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kairos ? Criar Tpico</title>
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
                        'marca-escuro':    '#C9523A',
                        'texto-padrao':    '#ffffff',
                        'texto-opaco':     '#8494b0',
                        'status-verde':    '#22c55e',
                        'status-amarelo':  '#f59e0b',
                        'status-vermelho': '#E16144',
                    },
                    fontFamily: { sora: ['Sora', 'sans-serif'], mono: ['JetBrains Mono', 'monospace'] }
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
        <a href="${pageContext.request.contextPath}/moderator-panel" class="flex shrink-0 items-center gap-2.5 px-3 py-2.5 bg-marca-kairos/15 rounded-lg text-marca-kairos text-[13px] transition-colors duration-150">
            <svg class="w-4 h-4 opacity-70" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M2 4h12M2 8h8M2 12h10"/></svg>
            Painel do Moderador
        </a>
        <% } %>
    </nav>
</aside>

<main class="flex-1 p-4 md:p-9 overflow-y-auto flex flex-col items-start">

    <a href="${pageContext.request.contextPath}/moderator-panel" class="self-start mb-6 inline-flex items-center gap-2 text-texto-padrao hover:text-marca-kairos transition-colors">
        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
        Voltar
    </a>

    <div class="w-full max-w-3xl mx-auto">
        <header class="mb-8">
            <p class="text-marca-kairos text-[11px] font-semibold tracking-widest uppercase mb-1">Moderao</p>
            <h1 class="text-[24px] md:text-[26px] font-bold">Criar novo tpico</h1>
            <p class="text-texto-opaco text-[12px] md:text-[13px] mt-1">Defina a matria e os pr-requisitos(se necessrio)</p>
        </header>

        <% if ("true".equals(request.getParameter("success"))) { %>
        <div id="success-alert" class="flex items-center gap-3 mb-6 p-4 bg-status-verde/10 border border-status-verde/30 rounded-xl text-status-verde text-[13px] font-semibold transition-opacity duration-500">
            Tpico criado com sucesso!
        </div>
        <% } %>

        <% if (request.getAttribute("erro") != null) { %>
        <div class="flex items-center gap-3 mb-6 p-4 bg-status-vermelho/10 border border-status-vermelho/30 rounded-xl text-status-vermelho text-[13px] font-semibold">
            <%= request.getAttribute("erro") %>
        </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/createTopic" method="POST" class="space-y-6">

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="space-y-2">
                    <label class="block text-[11px] font-semibold tracking-widest uppercase text-texto-opaco">Nome do Tpico</label>
                    <input type="text" name="name" required placeholder="Ex: Fraes, Matrizes..."
                           class="w-full px-4 py-3 bg-fundo-card border border-linha-divisoria rounded-xl text-[13px] text-texto-padrao outline-none focus:border-marca-kairos transition-colors">
                </div>

                <div class="space-y-2">
                    <label class="block text-[11px] font-semibold tracking-widest uppercase text-texto-opaco">Matria</label>
                    <select name="subject" required
                            class="w-full px-4 py-3 bg-fundo-card border border-linha-divisoria rounded-xl text-[13px] text-texto-padrao outline-none focus:border-marca-kairos transition-colors">
                        <option value="MATH">Matemtica</option>
                    </select>
                </div>
            </div>

            <div class="space-y-3 pt-2 border-t border-linha-divisoria">
                <label class="block text-[11px] font-semibold tracking-widest uppercase text-texto-opaco">Pr-requisitos</label>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-3 max-h-[850px] overflow-y-auto pr-2 custom-scrollbar">
                    <%
                        List<Topic> topics = (List<Topic>) request.getAttribute("topics");
                        if (topics != null && !topics.isEmpty()) {
                            for (Topic t : topics) {
                    %>
                    <label class="flex items-center gap-3 p-3 bg-fundo-card border border-linha-divisoria rounded-xl cursor-pointer transition-colors hover:border-marca-kairos has-[:checked]:border-marca-kairos has-[:checked]:bg-marca-kairos/8">
                        <input type="checkbox" name="preReqs" value="<%= t.getId() %>" class="w-4 h-4 text-marca-kairos bg-fundo-geral border-linha-divisoria rounded focus:ring-marca-kairos focus:ring-offset-fundo-card">
                        <span class="text-[13px] text-texto-padrao truncate"><%= t.getName() %></span>
                    </label>
                    <%      }
                    } else { %>
                    <p class="text-[12px] text-texto-opaco col-span-2 p-4 text-center">Nenhum tpico cadastrado ainda.</p>
                    <%  } %>
                </div>
            </div>

            <div class="flex justify-end pt-4">
                <button type="submit" class="w-full md:w-auto px-8 py-3 bg-gradient-to-r from-marca-kairos to-marca-escuro text-white text-[14px] font-semibold rounded-xl transition-all">
                    Criar tpico
                </button>
            </div>
        </form>
    </div>

    <script>
        const alert = document.getElementById('success-alert');
        if (alert) {
            setTimeout(() => {
                alert.style.opacity = '0';
                setTimeout(() => {
                    alert.remove();
                }, 500);
            }, 3000);
        }
    </script>
</main>
</body>
</html>