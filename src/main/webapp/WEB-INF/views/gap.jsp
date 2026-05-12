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

<jsp:include page="/WEB-INF/views/nav.jsp" />

<main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto">

    <div class="w-full max-w-3xl mx-auto">
        <header class="mb-8">
            <p class="text-marca-kairos text-[11px] font-semibold tracking-widest uppercase mb-1">Desempenho</p>
            <h1 class="text-[24px] md:text-[26px] font-bold">Lacunas de Aprendizado</h1>
            <p class="text-texto-opaco text-[12px] md:text-[13px] mt-1">Identificamos pontos de atenção baseados no seu desempenho recente.</p>
        </header>

        <div class="flex flex-wrap gap-3 mb-8 border-b border-linha-divisoria pb-6 text-[13px]">
            <button class="bg-marca-kairos text-white px-5 py-2 rounded-xl font-semibold transition-transform hover:scale-105 cursor-pointer">
                Todos
            </button>
            <button class="bg-fundo-card border border-linha-divisoria text-texto-opaco px-4 py-2 rounded-xl font-medium flex items-center gap-2 hover:text-white hover:border-marca-kairos transition-colors cursor-pointer">
                <div class="w-2 h-2 rounded-full bg-marca-kairos"></div> Novas
            </button>
            <button class="bg-fundo-card border border-linha-divisoria text-texto-opaco px-4 py-2 rounded-xl font-medium flex items-center gap-2 hover:text-white hover:border-status-amarelo transition-colors cursor-pointer">
                <div class="w-2 h-2 rounded-full bg-status-amarelo"></div> Em revisão
            </button>
        </div>

        <div class="space-y-5">
            <%
                List<Gap> lacunas = (List<Gap>) request.getAttribute("listaLacunas");

                if (lacunas != null && !lacunas.isEmpty()) {
                    for (Gap lacuna : lacunas) {

                        int total = lacuna.getQtySolvedQuestions();
                        int corretas = lacuna.getCorrectAnswers();
                        int porcentagem = 0;

                        if (total != 0) {
                            porcentagem = (corretas * 100) / total;
                        }

                        String corBorda = "";
                        String corBg = "";
                        String corTexto = "";
                        String labelStatus = "";
                        String opacityClass = "";
                        String subjectColorClass = "";
                        String titleColorClass = "";

                        if ("SOLVED".equalsIgnoreCase(lacuna.getStats())) {
                            corBorda = "bg-status-verde";
                            corBg = "bg-status-verde/10 border-status-verde/30";
                            corTexto = "text-status-verde";
                            labelStatus = "RESOLVIDA";
                            opacityClass = "opacity-60";
                            subjectColorClass = "text-texto-opaco";
                            titleColorClass = "text-texto-opaco line-through";

                        } else if (porcentagem < 50) {
                            corBorda = "bg-marca-kairos";
                            corBg = "bg-marca-kairos/10 border-marca-kairos/30";
                            corTexto = "text-marca-kairos";
                            labelStatus = "NOVA";
                            opacityClass = "";
                            subjectColorClass = "text-marca-kairos";
                            titleColorClass = "text-white";

                        } else {
                            corBorda = "bg-status-amarelo";
                            corBg = "bg-status-amarelo/10 border-status-amarelo/30";
                            corTexto = "text-status-amarelo";
                            labelStatus = "EM REVISÃO";
                            opacityClass = "";
                            subjectColorClass = "text-status-amarelo";
                            titleColorClass = "text-white";
                        }
            %>

            <div data-status="<%= labelStatus %>" class="lacuna-card bg-fundo-card border border-linha-divisoria rounded-2xl p-5 md:p-6 relative overflow-hidden transition-all hover:border-marca-kairos/50 shadow-lg <%= opacityClass %>">
                <div class="absolute left-0 top-0 bottom-0 w-1.5 <%= corBorda %>"></div>

                <div class="inline-flex items-center gap-1.5 <%= corBg %> <%= corTexto %> border px-3 py-1 rounded-lg text-[11px] font-bold mb-4 uppercase tracking-widest">
                    <div class="w-1.5 h-1.5 rounded-full <%= corBorda %>"></div> <%= labelStatus %>
                </div>

                <div class="text-[11px] text-texto-opaco font-semibold mb-1 flex items-center gap-2 tracking-widest uppercase">
                    <span class="<%= subjectColorClass %>"><%= lacuna.getSubject() %></span>
                    <span class="text-linha-divisoria">•</span>
                    <span><%= lacuna.getTopicName() %></span>
                </div>

                <h3 class="text-[18px] md:text-[20px] font-bold <%= titleColorClass %> mb-6">
                    Revisão de <%= lacuna.getTopicName() %>
                </h3>

                <div class="flex flex-wrap items-center gap-6 text-[13px] border-t border-linha-divisoria pt-4">
                    <div class="flex items-center gap-2">
                        <span class="text-texto-opaco">Acertos:</span>
                        <span class="<%= corTexto %> font-bold text-[14px]"><%= porcentagem %>%</span>
                    </div>
                    <div class="flex items-center gap-2">
                        <span class="text-texto-opaco">Questões respondidas:</span>
                        <span class="text-white font-bold text-[14px]"><%= total %></span>
                    </div>
                </div>
            </div>

            <%
                }
            } else {
            %>
            <div class="bg-fundo-card border border-linha-divisoria rounded-2xl p-8 text-center shadow-lg">
                <p class="text-texto-opaco text-[14px] font-medium">Nenhuma lacuna de aprendizado identificada até o momento</p>
            </div>
            <% } %>

        </div>
    </div>
</main>
</body>
</html>