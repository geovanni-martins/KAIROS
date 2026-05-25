<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.kairos.model.Gap" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lacunas - Kairos</title>

    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <%@ include file="styles.jsp" %>
    <script src="https://cdn.tailwindcss.com"></script>
     <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/favicon.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>

<body class="min-h-screen bg-background text-content font-sora flex flex-col md:flex-row">

<jsp:include page="/WEB-INF/views/nav.jsp" />

<main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto">

    <div class="w-full max-w-3xl mx-auto">
        <header class="mb-8">
            <p class="text-brand text-[11px] font-semibold tracking-widest uppercase mb-1">Desempenho</p>
            <h1 class="text-[24px] md:text-[26px] font-bold">Lacunas de Aprendizado</h1>
            <p class="text-muted text-[12px] md:text-[13px] mt-1">Identificamos pontos de atenção baseados no seu desempenho recente.</p>
        </header>

        <div class="flex flex-wrap gap-3 mb-8 border-b border-divider pb-6 text-[13px]">
            <button onclick="filterGaps('TODOS', this)" class="filter-button bg-brand text-white px-5 py-2 rounded-xl font-semibold transition-transform hover:scale-105 cursor-pointer border border-brand">
                Todos
            </button>
            <button onclick="filterGaps('NOVA', this)" class="filter-button bg-surface border border-divider text-muted px-4 py-2 rounded-xl font-medium flex items-center gap-2 hover:text-white transition-colors cursor-pointer">
                <div class="w-2 h-2 rounded-full bg-brand"></div> Novas
            </button>
            <button onclick="filterGaps('EM REVISÃO', this)" class="filter-button bg-surface border border-divider text-muted px-4 py-2 rounded-xl font-medium flex items-center gap-2 hover:text-white transition-colors cursor-pointer">
                <div class="w-2 h-2 rounded-full bg-warning"></div> Em revisão
            </button>
        </div>

        <div class="space-y-5">
            <%
                List<Gap> gaps = (List<Gap>) request.getAttribute("gapList");

                if (gaps != null && !gaps.isEmpty()) {
                    for (Gap gap : gaps) {

                        int total = gap.getQtySolvedQuestions();
                        int correctAnswers = gap.getCorrectAnswers();
                        int percentage = 0;

                        if (total != 0) {
                            percentage = (correctAnswers * 100) / total;
                        }

                        String borderColor = "";
                        String backgroundColor = "";
                        String textColor = "";
                        String labelStatus = "";
                        String opacityClass = "";
                        String subjectColorClass = "";
                        String titleColorClass = "";

                        if ("SOLVED".equalsIgnoreCase(gap.getStats())) {
                            borderColor = "bg-success";
                            backgroundColor = "bg-success/10 border-success/30";
                            textColor = "text-success";
                            labelStatus = "RESOLVIDA";
                            opacityClass = "opacity-60";
                            subjectColorClass = "text-muted";
                            titleColorClass = "text-muted line-through";

                        } else if (percentage < 50) {
                            borderColor = "bg-brand";
                            backgroundColor = "bg-brand/10 border-brand/30";
                            textColor = "text-brand";
                            labelStatus = "NOVA";
                            opacityClass = "";
                            subjectColorClass = "text-brand";
                            titleColorClass = "text-white";

                        } else {
                            borderColor = "bg-warning";
                            backgroundColor = "bg-warning/10 border-warning/30";
                            textColor = "text-warning";
                            labelStatus = "EM REVISÃO";
                            opacityClass = "";
                            subjectColorClass = "text-warning";
                            titleColorClass = "text-white";
                        }
            %>

            <div data-status="<%= labelStatus %>" class="gap-card bg-surface border border-divider rounded-2xl p-5 md:p-6 relative overflow-hidden transition-all hover:border-brand/50 shadow-lg <%= opacityClass %>">
                <div class="absolute left-0 top-0 bottom-0 w-1.5 <%= borderColor %>"></div>

                <div class="inline-flex items-center gap-1.5 <%= backgroundColor %> <%= textColor %> border px-3 py-1 rounded-lg text-[11px] font-bold mb-4 uppercase tracking-widest">
                    <div class="w-1.5 h-1.5 rounded-full <%= borderColor %>"></div> <%= labelStatus %>
                </div>

                <div class="text-[11px] text-muted font-semibold mb-1 flex items-center gap-2 tracking-widest uppercase">
                    <span class="<%= subjectColorClass %>"><%= gap.getSubject() %></span>
                    <span class="text-divider">•</span>
                    <span><%= gap.getTopicName() %></span>
                </div>

                <h3 class="text-[18px] md:text-[20px] font-bold <%= titleColorClass %> mb-6">
                    Revisão de <%= gap.getTopicName() %>
                </h3>

                <div class="flex flex-wrap items-center gap-6 text-[13px] border-t border-divider pt-4">
                    <div class="flex items-center gap-2">
                        <span class="text-muted">Acertos:</span>
                        <span class="<%= textColor %> font-bold text-[14px]"><%= percentage %>%</span>
                    </div>
                    <div class="flex items-center gap-2">
                        <span class="text-muted">Questões respondidas:</span>
                        <span class="text-white font-bold text-[14px]"><%= total %></span>
                    </div>
                </div>
            </div>

            <%
                }
            } else {
            %>
            <div class="bg-surface border border-divider rounded-2xl p-8 text-center shadow-lg">
                <p class="text-muted text-[14px] font-medium">Nenhuma lacuna de aprendizado identificada até o momento</p>
            </div>
            <% } %>

        </div>
    </div>
</main>

<script>
    function filterGaps(selectedStatus, clickedButton) {
        const cards = document.querySelectorAll('.gap-card');
        cards.forEach(card => {
            const cardStatus = card.getAttribute('data-status');
            if (selectedStatus === 'TODOS' || cardStatus === selectedStatus) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });

        const buttons = document.querySelectorAll('.filter-button');
        buttons.forEach(btn => {
            btn.className = "filter-button bg-surface border border-divider text-muted px-4 py-2 rounded-xl font-medium flex items-center gap-2 hover:text-white transition-colors cursor-pointer";
        });

        if (selectedStatus === 'TODOS') {
            clickedButton.className = "filter-button bg-brand text-white px-5 py-2 rounded-xl font-semibold transition-transform hover:scale-105 cursor-pointer border border-brand";
        } else if (selectedStatus === 'NOVA') {
            clickedButton.className = "filter-button bg-surface border border-brand text-white px-4 py-2 rounded-xl font-medium flex items-center gap-2 transition-colors cursor-pointer";
        } else if (selectedStatus === 'EM REVISÃO') {
            clickedButton.className = "filter-button bg-surface border border-warning text-white px-4 py-2 rounded-xl font-medium flex items-center gap-2 transition-colors cursor-pointer";
        }
    }
</script>

</body>
</html>
