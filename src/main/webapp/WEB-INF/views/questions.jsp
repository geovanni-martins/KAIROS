<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.kairos.model.Topic, com.kairos.model.Question, com.kairos.model.Alternative, java.util.List" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kairos - Questões</title>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <%@ include file="styles.jsp" %>
    <script src="https://cdn.tailwindcss.com"></script>
     <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/favicon.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body class="min-h-screen bg-background text-content font-sora flex flex-col md:flex-row">

<%@include file="nav.jsp"%>

<main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto">

    <header class="mb-8">
        <p class="text-brand text-[11px] font-semibold tracking-widest uppercase mb-1">Prática</p>
        <h1 class="text-[24px] md:text-[26px] font-bold">Questões Disponíveis</h1>
        <p class="text-muted text-[12px] md:text-[13px] mt-1">Teste seus conhecimentos</p>
    </header>

    <% if ("true".equals(request.getParameter("reported"))) { %>
    <div class="flex items-center gap-3 mb-6 p-4 bg-warning/10 border border-warning/30 rounded-xl text-warning text-[13px] font-semibold">
        <svg class="w-5 h-5 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
        Obrigado! Sua denúncia foi enviada e será analisada pelos moderadores
    </div>
    <% } %>

    <% if ("true".equals(request.getParameter("answered"))) {
        if ("true".equals(request.getParameter("correct"))) { %>
    <div class="flex items-center gap-3 mb-6 p-4 bg-success/10 border border-success/30 rounded-xl text-success text-[13px] font-semibold">
        Resposta correta! Seu progresso foi computado no sistema.
    </div>
    <% } else { %>
    <div class="flex items-center gap-3 mb-6 p-4 bg-danger/10 border border-danger/30 rounded-xl text-danger text-[13px] font-semibold">
        Resposta incorreta. Revise o assunto pois uma gap pode estar se formando
    </div>
    <% }
    } %>

    <form method="GET" action="${pageContext.request.contextPath}/questions" class="flex flex-col md:flex-row gap-3 mb-8">
        <select name="topicId" class="px-4 py-3 bg-surface border border-divider rounded-xl text-[13px] text-content outline-none focus:border-brand w-full md:w-64 transition-colors">
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
        <button type="submit" class="px-6 py-3 bg-brand/15 text-brand rounded-xl text-[13px] font-semibold hover:bg-brand hover:text-white transition-colors">
            Filtrar Assunto
        </button>
    </form>

    <div class="space-y-6">
        <%
            List<Question> questions = (List<Question>) request.getAttribute("questions");
            if (questions != null && !questions.isEmpty()) {
                for (Question q : questions) {
        %>
        <div class="p-5 md:p-6 bg-surface border border-divider rounded-2xl shadow-lg">

            <div class="flex justify-between items-start mb-4">
                <span class="px-3 py-1 bg-surface-hover text-muted text-[11px] font-bold rounded-lg uppercase tracking-wider">
                    Tópico: <%= q.getTopic().getName() != null ? q.getTopic().getName() : "Desconhecido" %>
                </span>
                <span class="px-3 py-1 border border-divider text-[11px] font-bold rounded-lg uppercase tracking-wider
                    <%= "easy".equals(q.getDifficulty()) ? "text-success" : ("medium".equals(q.getDifficulty()) ? "text-warning" : "text-danger") %>">
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
                    <label class="flex items-center gap-3 p-3 bg-background border border-divider rounded-xl cursor-pointer transition-colors hover:border-brand has-[:checked]:border-brand has-[:checked]:bg-brand/10 group">
                        <input type="radio" name="alternativeId" value="<%= alt.getId() %>" required class="hidden peer">
                        <div class="flex shrink-0 items-center justify-center w-6 h-6 rounded-full border border-muted peer-checked:border-brand peer-checked:bg-brand text-[11px] font-bold font-mono text-muted peer-checked:text-white transition-all">
                            <%= labels[i % labels.length] %>
                        </div>
                        <span class="text-[13px] text-content group-hover:text-white transition-colors"><%= alt.getText() %></span>
                    </label>
                    <% } %>
                </div>

                <div class="flex justify-end pt-3 mt-4">
                    <button type="submit" class="w-full md:w-auto px-6 py-2.5 bg-gradient-to-r from-brand to-brand-dark text-white text-[13px] font-semibold rounded-xl hover:opacity-90 active:scale-[.98] transition-all">
                        Enviar Resposta
                    </button>
                </div>
            </form>

            <div class="flex justify-end pt-3 mt-4 border-t border-divider">
                <a href="${pageContext.request.contextPath}/reportQuestion?questionId=<%= q.getId() %>&topicId=<%= q.getTopic().getId() %>" class="inline-flex items-center gap-1 text-[11px] font-semibold text-danger hover:text-content transition-colors">
                    <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 21v-4m0 0V5a2 2 0 012-2h6.5l1 1H21l-3 6 3 6h-8.5l-1-1H5a2 2 0 00-2 2zm9-13.5V9"></path></svg>
                    Reportar erro na questão
                </a>
            </div>

        </div>
        <%
            }
        } else {
        %>
        <div class="p-8 bg-surface border border-divider rounded-2xl text-center">
            <svg class="w-12 h-12 mx-auto text-divider mb-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2"></path></svg>
            <p class="text-content text-[15px] font-bold">Nenhuma questão encontrada</p>
            <p class="text-muted text-[13px] mt-1">Ainda não existem perguntas cadastradas para este tópico</p>
        </div>
        <% } %>
    </div>
</main>
</body>
</html>