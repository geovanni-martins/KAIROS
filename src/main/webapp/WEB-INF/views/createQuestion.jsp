<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.kairos.model.Topic, java.util.List" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kairos - Criar Questão</title>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <%@ include file="styles.jsp" %>
    <script src="https://cdn.tailwindcss.com"></script>
     <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/favicon.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body class="min-h-screen bg-background text-content font-sora flex flex-col md:flex-row">

<%@include file="nav.jsp"%>

<main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto flex flex-col">
    <a href="${pageContext.request.contextPath}/manageQuestions" class="self-start mb-6 inline-flex items-center gap-2 text-content hover:text-brand transition-colors">
        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
        Voltar
    </a>
    <div class="w-full max-w-3xl mx-auto">
        <header class="mb-8">
            <p class="text-brand text-[11px] font-semibold tracking-widest uppercase mb-1">Moderação</p>
            <h1 class="text-[24px] md:text-[26px] font-bold">Criar nova questão</h1>
            <p class="text-muted text-[12px] md:text-[13px] mt-1">Preencha todos os campos</p>
        </header>

        <% if ("true".equals(request.getParameter("success"))) { %>
        <div id="success-alert" class="flex items-center gap-3 mb-6 p-4 bg-success/10 border border-success/30 rounded-xl text-success text-[13px] font-semibold transition-opacity duration-500">
            Questão criada com sucesso!
        </div>
        <% } %>

        <% if (request.getAttribute("error") != null) { %>
        <div class="flex items-center gap-3 mb-6 p-4 bg-danger/10 border border-danger/30 rounded-xl text-danger text-[13px] font-semibold">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/createQuestion" method="POST" class="space-y-5 md:space-y-6">

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="space-y-2">
                    <label class="block text-[11px] font-semibold tracking-widest uppercase text-muted">Tópico</label>
                    <select name="topicId" required
                            class="w-full px-4 py-3 bg-surface border border-divider rounded-xl text-[13px] text-content outline-none focus:border-brand transition-colors">
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
                    <label class="block text-[11px] font-semibold tracking-widest uppercase text-muted">Dificuldade</label>
                    <select name="difficulty" required
                            class="w-full px-4 py-3 bg-surface border border-divider rounded-xl text-[13px] text-content outline-none focus:border-brand transition-colors">
                        <option value="" disabled selected>Selecione</option>
                        <option value="easy">Fácil</option>
                        <option value="medium">Média</option>
                        <option value="hard">Difícil</option>
                    </select>
                </div>
            </div>

            <div class="space-y-2">
                <label class="block text-[11px] font-semibold tracking-widest uppercase text-muted">Enunciado</label>
                <textarea name="statement" rows="4" required placeholder="Digite o enunciado da questão..."
                          class="w-full px-4 py-3 bg-surface border border-divider rounded-xl text-[13px] text-content outline-none focus:border-brand transition-colors resize-none"></textarea>
            </div>

            <div class="space-y-2">
                <label class="block text-[11px] font-semibold tracking-widest uppercase text-muted">Alternativas — marque a correta</label>
                <div class="space-y-3" id="alternatives">
                    <% String[] letters = {"A","B","C","D","E"};
                        for (int i = 0; i < 5; i++) { %>
                    <label class="flex items-start md:items-center gap-3 p-3 md:p-4 bg-surface border border-divider rounded-xl cursor-pointer transition-colors hover:border-brand has-[:checked]:border-brand has-[:checked]:bg-brand/8">
                        <input type="radio" name="correct" value="<%= i %>" required class="hidden peer">
                        <div class="flex shrink-0 items-center justify-center w-7 h-7 rounded-full border border-muted peer-checked:border-brand peer-checked:bg-brand text-[12px] font-bold font-mono text-muted peer-checked:text-white transition-all alt-letter-<%= i %>">
                            <%= letters[i] %>
                        </div>
                        <input type="text" name="alt<%= i %>" required placeholder="Alternativa <%= letters[i] %>..."
                               class="flex-1 w-full bg-transparent text-[13px] text-content outline-none placeholder:text-muted/50 pt-1 md:pt-0">
                    </label>
                    <% } %>
                </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="space-y-2">
                    <label class="block text-[11px] font-semibold tracking-widest uppercase text-muted">Justificativa</label>
                    <input type="text" name="justification" required placeholder="Explique o porquê da resposta..."
                           class="w-full px-4 py-3 bg-surface border border-divider rounded-xl text-[13px] text-content outline-none focus:border-brand transition-colors">
                </div>
            </div>

            <div class="flex justify-end pt-4">
                <button type="submit"
                        class="w-full md:w-auto px-8 py-3.5 md:py-3 bg-gradient-to-r from-brand to-brand-dark text-white text-[14px] font-semibold rounded-xl hover:opacity-90 active:scale-[.98] transition-all">
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