<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.kairos.model.Question, com.kairos.model.Topic, com.kairos.model.Alternative, java.util.List" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Questão | Kairos</title>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <style type="text/tailwindcss">
        @theme {
            --color-fundo-geral: #0B101E;
            --color-fundo-card: #161F35;
            --color-linha-divisoria: #1D2B48;
            --color-marca-kairos: #E16144;
            --color-texto-padrao: #ffffff;
            --color-texto-opaco: #8494b0;
            --color-status-vermelho: #E16144;
            --font-sora: "Sora", sans-serif;
            --font-mono: "JetBrains Mono", monospace;
        }
    </style>
</head>
<body class="min-h-screen bg-fundo-geral text-texto-padrao font-sora flex flex-col md:flex-row">

<%@include file="nav.jsp"%>

<main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto flex justify-center">

    <% Question question = (Question) request.getAttribute("question"); %>

    <div class="w-full max-w-4xl bg-fundo-card border border-linha-divisoria rounded-2xl shadow-lg p-6 md:p-8 h-fit">

        <div class="flex items-center gap-3 mb-8 border-b border-linha-divisoria pb-4">
            <div class="w-10 h-10 rounded-full bg-amber-500/10 flex items-center justify-center text-amber-500">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"></path></svg>
            </div>
            <div>
                <h1 class="text-[20px] font-bold text-texto-padrao">Editar Questão #<%= question != null ? question.getId() : "" %></h1>
                <p class="text-[12px] text-texto-opaco">Corrija erros reportados ou atualize a questão.</p>
            </div>
        </div>

        <% if (question != null) { %>
        <form action="${pageContext.request.contextPath}/editQuestion" method="POST" class="space-y-6">
            <input type="hidden" name="questionId" value="<%= question.getId() %>">

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                    <label class="block text-[12px] font-bold text-texto-opaco mb-2 uppercase tracking-wider">Tópico Associado</label>
                    <select name="topicId" class="w-full px-4 py-3 bg-fundo-geral border border-linha-divisoria rounded-xl text-[13px] text-texto-padrao outline-none focus:border-marca-kairos transition-colors">
                        <%
                            List<Topic> topics = (List<Topic>) request.getAttribute("topics");
                            if (topics != null) {
                                for (Topic t : topics) {
                                    boolean isSelected = question.getTopic() != null && question.getTopic().getId() == t.getId();
                        %>
                        <option value="<%= t.getId() %>" <%= isSelected ? "selected" : "" %>><%= t.getName() %></option>
                        <%      }
                        } %>
                    </select>
                </div>
                <div>
                    <label class="block text-[12px] font-bold text-texto-opaco mb-2 uppercase tracking-wider">Dificuldade</label>
                    <select name="difficulty" class="w-full px-4 py-3 bg-fundo-geral border border-linha-divisoria rounded-xl text-[13px] text-texto-padrao outline-none focus:border-marca-kairos transition-colors">
                        <option value="easy" <%= "easy".equals(question.getDifficulty()) ? "selected" : "" %>>Fácil</option>
                        <option value="medium" <%= "medium".equals(question.getDifficulty()) ? "selected" : "" %>>Média</option>
                        <option value="hard" <%= "hard".equals(question.getDifficulty()) ? "selected" : "" %>>Difícil</option>
                    </select>
                </div>
            </div>

            <div>
                <label class="block text-[12px] font-bold text-texto-opaco mb-2 uppercase tracking-wider">Enunciado da Questão</label>
                <textarea name="statement" rows="4" required class="w-full px-4 py-3 bg-fundo-geral border border-linha-divisoria rounded-xl text-[13px] text-texto-padrao outline-none focus:border-marca-kairos transition-colors resize-none"><%= question.getStatement() %></textarea>
            </div>

            <div>
                <label class="block text-[12px] font-bold text-texto-opaco mb-3 uppercase tracking-wider">Alternativas (Selecione a correta)</label>
                <div class="space-y-3">
                    <%
                        List<Alternative> alts = question.getAlternatives();
                        String[] labels = {"A", "B", "C", "D", "E"};
                        for (int i = 0; i < 5; i++) {
                            Alternative alt = (alts != null && i < alts.size()) ? alts.get(i) : new Alternative("", false, question);
                    %>
                    <div class="flex items-center gap-3 p-2 bg-fundo-geral border border-linha-divisoria rounded-xl transition-colors focus-within:border-marca-kairos">
                        <div class="pl-3">
                            <input type="radio" name="correctAlternativeIndex" value="<%= i %>" <%= alt.getCorrect() ? "checked" : "" %> required class="w-4 h-4 accent-marca-kairos cursor-pointer">
                        </div>

                        <div class="flex shrink-0 items-center justify-center w-6 h-6 rounded-full bg-linha-divisoria text-[11px] font-bold font-mono text-white">
                            <%= labels[i] %>
                        </div>

                        <input type="hidden" name="altId_<%= i %>" value="<%= alt.getId() %>">
                        <input type="text" name="altText_<%= i %>" value="<%= alt.getText() %>" required class="flex-1 bg-transparent border-none outline-none text-[13px] text-texto-padrao placeholder-texto-opaco/50 py-2" placeholder="Escreva a alternativa <%= labels[i] %>...">
                    </div>
                    <% } %>
                </div>
            </div>

            <div class="flex flex-col-reverse md:flex-row justify-end gap-3 pt-6 border-t border-linha-divisoria mt-8">
                <a href="${pageContext.request.contextPath}/reports" class="px-6 py-3 text-[13px] font-bold text-texto-opaco hover:text-white text-center transition-colors">
                    Cancelar
                </a>
                <button type="submit" class="px-6 py-3 bg-amber-500 text-white rounded-xl text-[13px] font-bold hover:bg-amber-600 transition-all active:scale-[.98]">
                    Salvar Alterações
                </button>
            </div>
        </form>
        <% } else { %>
        <p class="text-status-vermelho">Erro ao carregar a questão</p>
        <% } %>
    </div>
</main>
</body>
</html>