<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.kairos.model.Topic, com.kairos.model.MultipleChoiceQuestion, com.kairos.model.Alternative, java.util.List" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kairos - Questões</title>
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
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/icons/favicon.png">
</head>
<body class="min-h-screen bg-fundo-geral text-texto-padrao font-sora flex flex-col md:flex-row">

<%@include file="nav.jsp"%>

<main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto">

    <header class="mb-8">
        <p class="text-marca-kairos text-[11px] font-semibold tracking-widest uppercase mb-1">Prática</p>
        <h1 class="text-[24px] md:text-[26px] font-bold">Questões Disponíveis</h1>
        <p class="text-texto-opaco text-[12px] md:text-[13px] mt-1">Teste seus conhecimentos</p>
    </header>

    <% if ("true".equals(request.getParameter("reported"))) { %>
    <div class="flex items-center gap-3 mb-6 p-4 bg-status-amarelo/10 border border-status-amarelo/30 rounded-xl text-status-amarelo text-[13px] font-semibold">
        <svg class="w-5 h-5 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
        Obrigado! Sua denúncia foi enviada e será analisada pelos moderadores
    </div>
    <% } %>

    <% if ("true".equals(request.getParameter("answered"))) {
        if ("true".equals(request.getParameter("correct"))) { %>
    <div class="flex items-center gap-3 mb-6 p-4 bg-status-verde/10 border border-status-verde/30 rounded-xl text-status-verde text-[13px] font-semibold">
        Resposta correta! Seu progresso foi computado no sistema.
    </div>
    <% } else { %>
    <div class="flex items-center gap-3 mb-6 p-4 bg-status-vermelho/10 border border-status-vermelho/30 rounded-xl text-status-vermelho text-[13px] font-semibold">
        Resposta incorreta. Revise o assunto pois uma lacuna pode estar se formando
    </div>
    <% } } %>

    <form method="GET" action="${pageContext.request.contextPath}/questions" class="flex flex-col md:flex-row gap-3 mb-8">
        <select name="topicId" class="px-4 py-3 bg-fundo-card border border-linha-divisoria rounded-xl text-[13px] text-texto-padrao outline-none focus:border-marca-kairos w-full md:w-64 transition-colors">
            <option value="">Todos os Tópicos</option>
            <%
                List<Topic> topics = (List<Topic>) request.getAttribute("topics");
                String selectedTopic = (String) request.getAttribute("selectedTopic");
                if (topics != null) {
                    for (Topic t : topics) {
                        String selected = (selectedTopic != null && selectedTopic.equals(String.valueOf(t.getId()))) ? "selected" : "";
            %>
            <option value="<%= t.getId() %>" <%= selected %>><%= t.getName() %></option>
            <%      }
            } %>
        </select>
        <button type="submit" class="px-6 py-3 bg-marca-kairos/15 text-marca-kairos rounded-xl text-[13px] font-semibold hover:bg-marca-kairos hover:text-white transition-colors">
            Filtrar Assunto
        </button>
    </form>

    <div class="space-y-6">
        <%
            List<MultipleChoiceQuestion> questions = (List<MultipleChoiceQuestion>) request.getAttribute("questions");
            if (questions != null && !questions.isEmpty()) {
                for (MultipleChoiceQuestion q : questions) {
        %>
        <div class="p-5 md:p-6 bg-fundo-card border border-linha-divisoria rounded-2xl shadow-lg" id="question-card-<%= q.getId() %>">

            <div class="flex justify-between items-start mb-4">
                <span class="px-3 py-1 bg-fundo-hover text-texto-opaco text-[11px] font-bold rounded-lg uppercase tracking-wider">
                    Tópico: <%= q.getTopic().getName() != null ? q.getTopic().getName() : "Desconhecido" %>
                </span>
                <span class="px-3 py-1 border border-linha-divisoria text-[11px] font-bold rounded-lg uppercase tracking-wider
                    <%= "easy".equals(q.getDifficulty()) ? "text-status-verde" : ("medium".equals(q.getDifficulty()) ? "text-status-amarelo" : "text-status-vermelho") %>">
                    <%= "easy".equals(q.getDifficulty()) ? "Fácil" : "medium".equals(q.getDifficulty()) ? "Média" : "Difícil" %>
                </span>
            </div>

            <p class="text-[14px] leading-relaxed mb-5"><%= q.getStatement() %></p>

            <form method="POST" action="${pageContext.request.contextPath}/questions" class="space-y-3">
                <input type="hidden" name="questionId" value="<%= q.getId() %>">
                <input type="hidden" name="topicId" value="<%= q.getTopic().getId() %>">

                <div class="space-y-2">
                    <%
                        List<Alternative> alts = q.getAlternatives();
                        String[] labels = {"A", "B", "C", "D", "E"};
                        for (int i = 0; i < alts.size(); i++) {
                            Alternative alt = alts.get(i);
                    %>
                    <label class="flex items-center gap-3 p-3 bg-fundo-geral border border-linha-divisoria rounded-xl cursor-pointer transition-colors hover:border-marca-kairos has-[:checked]:border-marca-kairos has-[:checked]:bg-marca-kairos/10 group">
                        <input type="radio" name="alternativeId" value="<%= alt.getId() %>" required class="hidden peer">
                        <div class="flex shrink-0 items-center justify-center w-6 h-6 rounded-full border border-texto-opaco peer-checked:border-marca-kairos peer-checked:bg-marca-kairos text-[11px] font-bold font-mono text-texto-opaco peer-checked:text-white transition-all">
                            <%= labels[i % labels.length] %>
                        </div>
                        <span class="text-[13px] text-texto-padrao group-hover:text-white transition-colors"><%= alt.getText() %></span>
                    </label>
                    <% } %>
                </div>

                <div class="flex justify-end pt-3 mt-4">
                    <button type="submit" class="w-full md:w-auto px-6 py-2.5 bg-gradient-to-r from-marca-kairos to-marca-escuro text-white text-[13px] font-semibold rounded-xl hover:opacity-90 active:scale-[.98] transition-all">
                        Enviar Resposta
                    </button>
                </div>
            </form>

            <div class="flex justify-end pt-3 mt-4 border-t border-linha-divisoria">
                <a href="${pageContext.request.contextPath}/reportQuestion?questionId=<%= q.getId() %>&topicId=<%= q.getTopic().getId() %>"
                   onclick="sessionStorage.setItem('reportedQuestion', '<%= q.getId() %>')"
                   class="inline-flex items-center gap-1 text-[11px] font-semibold text-status-vermelho hover:text-texto-padrao transition-colors">
                    <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 21v-4m0 0V5a2 2 0 012-2h6.5l1 1H21l-3 6 3 6h-8.5l-1-1H5a2 2 0 00-2 2zm9-13.5V9"></path></svg>
                    Reportar erro na questão
                </a>
            </div>

        </div>
        <%
            }
        } else {
        %>
        <div class="p-8 bg-fundo-card border border-linha-divisoria rounded-2xl text-center">
            <svg class="w-12 h-12 mx-auto text-linha-divisoria mb-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path></svg>
            <p class="text-texto-padrao text-[15px] font-bold">Nenhuma questão encontrada</p>
            <p class="text-texto-opaco text-[13px] mt-1">Ainda não existem perguntas cadastradas para este tópico</p>
        </div>
        <% } %>
    </div>
</main>

<script>
    const reportedId = sessionStorage.getItem('reportedQuestion');
    if (reportedId) {
        const card = document.getElementById('question-card-' + reportedId);
        if (card) card.style.display = 'none';
        sessionStorage.removeItem('reportedQuestion');
    }
</script>

</body>
</html>