<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.kairos.model.Topic, java.util.List" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kairos - Criar Questão</title>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <style type="text/tailwindcss">
        @theme {
            --color-fundo-geral: #0B101E;
            --color-fundo-card: #161F35;
            --color-fundo-hover: #1D2B48;
            --color-linha-divisoria: #1D2B48;
            --color-marca-kairos: #E16144;
            --color-marca-escuro: #C9523A;
            --color-texto-padrao: #ffffff;
            --color-texto-opaco: #8494b0;
            --color-status-verde: #22c55e;
            --color-status-amarelo: #f59e0b;
            --color-status-vermelho: #E16144;
            --font-sora: "Sora", sans-serif;
            --font-mono: "JetBrains Mono", monospace;
        }
    </style>
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
            Painel de Administrador
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

<main class="flex-1 p-4 md:p-9 overflow-y-auto flex flex-col">
    <a href="${pageContext.request.contextPath}/moderator-panel" class="self-start mb-6 inline-flex items-center gap-2 text-texto-padrao hover:text-marca-kairos transition-colors">
        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
        Voltar
    </a>
    <div class="w-full max-w-3xl mx-auto">
        <header class="mb-8">
            <p class="text-marca-kairos text-[11px] font-semibold tracking-widest uppercase mb-1">Moderação</p>
            <h1 class="text-[24px] md:text-[26px] font-bold">Criar nova questão</h1>
            <p class="text-texto-opaco text-[12px] md:text-[13px] mt-1">Preencha todos os campos</p>
        </header>

        <% if ("true".equals(request.getParameter("success"))) { %>
        <div id="success-alert" class="flex items-center gap-3 mb-6 p-4 bg-status-verde/10 border border-status-verde/30 rounded-xl text-status-verde text-[13px] font-semibold transition-opacity duration-500">
            Questão criada com sucesso!
        </div>
        <% } %>

        <% if (request.getAttribute("erro") != null) { %>
        <div class="flex items-center gap-3 mb-6 p-4 bg-status-vermelho/10 border border-status-vermelho/30 rounded-xl text-status-vermelho text-[13px] font-semibold">
            <%= request.getAttribute("erro") %>
        </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/createQuestion" method="POST" class="space-y-5 md:space-y-6">

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="space-y-2">
                    <label class="block text-[11px] font-semibold tracking-widest uppercase text-texto-opaco">Tópico</label>
                    <select name="topicId" required
                            class="w-full px-4 py-3 bg-fundo-card border border-linha-divisoria rounded-xl text-[13px] text-texto-padrao outline-none focus:border-marca-kairos transition-colors">
                        <option value="" disabled selected>Selecione um tópico</option>
                        <%
                            List<Topic> topics = (List<Topic>) request.getAttribute("topics");
                            if (topics != null) {
                                for (Topic t : topics) {
                        %>
                        <option value="<%= t.getId() %>"><%= t.getName() %></option>
                        <%      }
                        }
                        %>
                    </select>
                </div>
                <div class="space-y-2">
                    <label class="block text-[11px] font-semibold tracking-widest uppercase text-texto-opaco">Dificuldade</label>
                    <select name="difficulty" required
                            class="w-full px-4 py-3 bg-fundo-card border border-linha-divisoria rounded-xl text-[13px] text-texto-padrao outline-none focus:border-marca-kairos transition-colors">
                        <option value="" disabled selected>Selecione</option>
                        <option value="easy">Fácil</option>
                        <option value="medium">Média</option>
                        <option value="hard">Difícil</option>
                    </select>
                </div>
            </div>

            <div class="space-y-2">
                <label class="block text-[11px] font-semibold tracking-widest uppercase text-texto-opaco">Enunciado</label>
                <textarea name="statement" rows="4" required placeholder="Digite o enunciado da questão..."
                          class="w-full px-4 py-3 bg-fundo-card border border-linha-divisoria rounded-xl text-[13px] text-texto-padrao outline-none focus:border-marca-kairos transition-colors resize-none"></textarea>
            </div>

            <div class="space-y-2">
                <label class="block text-[11px] font-semibold tracking-widest uppercase text-texto-opaco">Alternativas — marque a correta</label>
                <div class="space-y-3" id="alternatives">
                    <% String[] letters = {"A","B","C","D","E"};
                        for (int i = 0; i < 5; i++) { %>
                    <label class="flex items-start md:items-center gap-3 p-3 md:p-4 bg-fundo-card border border-linha-divisoria rounded-xl cursor-pointer transition-colors hover:border-marca-kairos has-[:checked]:border-marca-kairos has-[:checked]:bg-marca-kairos/8">
                        <input type="radio" name="correct" value="<%= i %>" required class="hidden peer">
                        <div class="flex shrink-0 items-center justify-center w-7 h-7 rounded-full border border-texto-opaco peer-checked:border-marca-kairos peer-checked:bg-marca-kairos text-[12px] font-bold font-mono text-texto-opaco peer-checked:text-white transition-all alt-letter-<%= i %>">
                            <%= letters[i] %>
                        </div>
                        <input type="text" name="alt<%= i %>" required placeholder="Alternativa <%= letters[i] %>..."
                               class="flex-1 w-full bg-transparent text-[13px] text-texto-padrao outline-none placeholder:text-texto-opaco/50 pt-1 md:pt-0">
                    </label>
                    <% } %>
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="space-y-2">
                    <label class="block text-[11px] font-semibold tracking-widest uppercase text-texto-opaco">Gabarito</label>
                    <input type="text" name="template" required placeholder="Ex: Alternativa C"
                           class="w-full px-4 py-3 bg-fundo-card border border-linha-divisoria rounded-xl text-[13px] text-texto-padrao outline-none focus:border-marca-kairos transition-colors">
                </div>
                <div class="space-y-2">
                    <label class="block text-[11px] font-semibold tracking-widest uppercase text-texto-opaco">Justificativa</label>
                    <input type="text" name="justification" required placeholder="Explique o porquê da resposta..."
                           class="w-full px-4 py-3 bg-fundo-card border border-linha-divisoria rounded-xl text-[13px] text-texto-padrao outline-none focus:border-marca-kairos transition-colors">
                </div>
            </div>

            <div class="flex justify-end pt-4">
                <button type="submit"
                        class="w-full md:w-auto px-8 py-3.5 md:py-3 bg-gradient-to-r from-marca-kairos to-marca-escuro text-white text-[14px] font-semibold rounded-xl hover:opacity-90 active:scale-[.98] transition-all">
                    Criar questão
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