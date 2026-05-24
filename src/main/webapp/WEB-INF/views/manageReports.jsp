<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.kairos.model.Report, com.kairos.model.Alternative, java.util.List" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciar Denúncias | Kairos</title>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <style type="text/tailwindcss">
        @theme {
            --color-fundo-geral: #0B101E;
            --color-fundo-card: #161F35;
            --color-fundo-hover: #1D2B48;
            --color-linha-divisoria: #1D2B48;
            --color-marca-kairos: #E16144;
            --color-status-verde: #22c55e;
            --color-status-vermelho: #E16144;
            --color-texto-padrao: #ffffff;
            --color-texto-opaco: #8494b0;
            --font-sora: "Sora", sans-serif;
        }
    </style>
     <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/icons/favicon.png">
</head>
<body class="min-h-screen bg-fundo-geral text-texto-padrao font-sora flex flex-col md:flex-row">

<%@include file="nav.jsp"%>

<main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto">

    <a href="${pageContext.request.contextPath}/moderator-panel" class="inline-flex items-center gap-2 text-texto-padrao hover:text-white text-[13px] font-semibold mb-6 transition-colors w-fit group">
        <svg class="w-4 h-4 group-hover:-translate-x-1 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
        Voltar
    </a>

    <header class="mb-8">
        <p class="text-status-vermelho text-[11px] font-semibold tracking-widest uppercase mb-1">Moderação</p>
        <h1 class="text-[24px] md:text-[26px] font-bold">Questões Reportadas pelos alunos</h1>
        <p class="text-texto-opaco text-[12px] md:text-[13px] mt-1">Gerencie e analise possíveis erros nas questões do sistema</p>
    </header>

    <% if ("true".equals(request.getParameter("resolved"))) { %>
    <div class="flex items-center gap-3 mb-6 p-4 bg-status-verde/10 border border-status-verde/30 rounded-xl text-status-verde text-[13px] font-semibold">
        <svg class="w-5 h-5 shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
        Report marcado como analisado
    </div>
    <% } %>

    <%
        List<Report> reports = (List<Report>) request.getAttribute("reports");

        if (reports == null || reports.isEmpty()) {
    %>
    <div class="p-8 bg-fundo-card border border-linha-divisoria rounded-2xl text-center">
        <svg class="w-12 h-12 mx-auto text-status-verde mb-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
        <p class="text-texto-padrao text-[15px] font-bold">Nenhuma denúncia pendente no momento</p>
    </div>
    <%  } else { %>

    <div class="space-y-6">
        <% for (Report report : reports) { %>
        <div class="p-5 md:p-6 bg-fundo-card border border-status-vermelho/30 rounded-2xl shadow-lg relative overflow-hidden">

            <div class="absolute left-0 top-0 bottom-0 w-1 bg-status-vermelho"></div>

            <div class="flex flex-col md:flex-row justify-between items-start border-b border-linha-divisoria pb-4 mb-4 gap-4">
                <div>
                    <span class="text-status-vermelho text-[14px] font-bold uppercase tracking-wider">
                        Report #<%= report.getId() %>
                    </span>
                    <p class="text-[12px] text-texto-opaco mt-1 flex gap-2 items-center">
                        <span><%= report.getCreatedAt() != null ? report.getCreatedAt().toString().substring(0, 10) : "Data Indisponível" %></span>
                        <span>|</span>
                        <span>Aluno: <strong class="text-texto-padrao"><%= report.getStudent() != null ? report.getStudent().getName() : "Desconhecido" %></strong></span>
                    </p>
                </div>
            </div>

            <div class="space-y-4">
                <div>
                    <p class="text-[11px] text-texto-opaco uppercase font-bold mb-2 tracking-wider">Enunciado da Questão</p>
                    <p class="text-[13px] bg-fundo-geral p-4 rounded-xl border border-linha-divisoria leading-relaxed text-texto-padrao">
                        <%= report.getQuestion() != null ? report.getQuestion().getStatement() : "Questão não encontrada" %>
                    </p>
                </div>

                <div class="mt-3 space-y-1">
                    <p class="text-[11px] text-texto-opaco uppercase font-bold mb-1">Alternativas:</p>
                    <% if (report.getQuestion() != null && report.getQuestion().getAlternatives() != null) {
                        for (Alternative alt : report.getQuestion().getAlternatives()) { %>
                    <div class="text-[12px] p-2 bg-fundo-geral rounded border border-linha-divisoria <%= alt.getCorrect() ? "text-status-verde border-status-verde/30" : "text-texto-opaco" %>">
                        <%= alt.getText() %> <%= alt.getCorrect() ? "(Correta)" : "" %>
                    </div>
                    <% }
                    } %>
                </div>

                <div>
                    <p class="text-[11px] text-status-vermelho uppercase font-bold mb-2 tracking-wider">Motivo da Denúncia</p>
                    <p class="text-[14px] font-bold text-status-vermelho bg-status-vermelho/10 p-4 rounded-xl border border-status-vermelho/20">
                        "<%= report.getReason() %>"
                    </p>
                </div>
            </div>

            <div class="flex flex-wrap justify-end gap-3 pt-4 mt-5 border-t border-linha-divisoria">
                <form action="${pageContext.request.contextPath}/editQuestion" method="GET">
                    <input type="hidden" name="questionId" value="<%= report.getQuestion() != null ? report.getQuestion().getId() : "" %>">
                    <button type="submit" class="px-4 py-2 bg-amber-500/10 text-amber-500 border border-amber-500/30 text-[12px] font-bold rounded-xl hover:bg-amber-500 hover:text-white transition-all">
                        Editar Questão
                    </button>
                </form>

                <form action="${pageContext.request.contextPath}/deleteQuestion" method="POST" onsubmit="return confirm('Tem certeza que deseja excluir esta questão?');">
                    <input type="hidden" name="questionId" value="<%= report.getQuestion() != null ? report.getQuestion().getId() : "" %>">
                    <button type="submit" class="px-4 py-2 bg-status-vermelho/10 text-status-vermelho border border-status-vermelho/30 text-[12px] font-bold rounded-xl hover:bg-status-vermelho hover:text-white transition-all">
                        Excluir Questão
                    </button>
                </form>

                <form action="${pageContext.request.contextPath}/reports" method="POST">
                    <input type="hidden" name="reportId" value="<%= report.getId() %>">
                    <button type="submit" class="px-4 py-2 bg-status-verde/15 text-status-verde border border-status-verde/30 text-[12px] font-bold rounded-xl hover:bg-status-verde hover:text-white transition-all">
                        Resolver Report
                    </button>
                </form>
            </div>
        </div>
        <% } %>
    </div>
    <% } %>

</main>
</body>
</html>