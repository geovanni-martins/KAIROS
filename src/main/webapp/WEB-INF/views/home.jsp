<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.kairos.model.StudentTopic" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kairos - Dashboard</title>

    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>

    <style type="text/tailwindcss">
        @theme {
            --color-fundo-geral: #0B101E;
            --color-fundo-card: #161F35;
            --color-fundo-hover: #1D2B48;
            --color-linha-divisoria: #1D2B48;
            --color-marca-kairos: #E16144;
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
<body class="flex min-h-screen bg-fundo-geral text-texto-padrao font-sora">

<div class="flex flex-col md:flex-row w-full min-h-screen">

    <%@include file="nav.jsp"%>

    <main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto">

        <header class="flex items-start justify-between mb-6 md:mb-9">
            <div>
                <p class="mb-1 text-marca-kairos text-[11px] md:text-[12px] font-semibold tracking-widest uppercase">Bem-vindo(a)</p>
                <h1 id="nome-usuario-titulo" class="text-texto-padrao text-[22px] md:text-[26px] font-bold">${user.name}</h1>
                <p id="subtitulo-boas-vindas" class="mt-1 text-texto-opaco text-[12px] md:text-[13px]">
                    <% if ("student".equals(roleSidebar)) { %>
                    Continue de onde parou, você está indo bem
                    <% } else { %>
                    Gerencie o conteúdo do sistema
                    <% } %>
                </p>
            </div>
            <div class="flex items-center">
                <span id="badge-papel" class="px-3 py-1.5 bg-marca-kairos/15 rounded-full text-marca-kairos text-[10px] md:text-[11px] font-semibold tracking-wide uppercase">...</span>
            </div>
        </header>

        <% if ("student".equals(roleSidebar)) { %>
        <section id="secao-estudante">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-7">
                <div class="relative overflow-hidden p-5 bg-fundo-card border border-linha-divisoria rounded-xl shadow-md shadow-black/10 transition-colors duration-200 hover:border-marca-kairos before:absolute before:top-0 before:left-0 before:w-[3px] before:h-full before:bg-marca-kairos before:rounded-l-xl">
                    <p class="mb-3 text-texto-padrao text-[11px] font-semibold tracking-wider uppercase">Questões respondidas</p>
                    <p class="text-texto-padrao font-mono text-[28px] md:text-[32px] font-bold leading-none"><% if (request.getAttribute("solvedQuestions") != null) { %>${solvedQuestions}<% } else { %>0<% } %></p>
                    <p class="flex items-center gap-1 mt-2.5 text-status-verde text-[12px]">Foco na meta!</p>
                </div>

                <div class="relative overflow-hidden p-5 bg-fundo-card border border-linha-divisoria rounded-xl shadow-md shadow-black/10 transition-colors duration-200 hover:border-marca-kairos before:absolute before:top-0 before:left-0 before:w-[3px] before:h-full before:bg-marca-kairos before:rounded-l-xl">
                    <p class="mb-3 text-texto-padrao text-[11px] font-semibold tracking-wider uppercase">Percentual de acertos</p>
                    <p class="text-texto-padrao font-mono text-[28px] md:text-[32px] font-bold leading-none"><% if (request.getAttribute("percentageCorrectAnswers") != null) { %>${percentageCorrectAnswers}<% } else { %>0<% } %><span class="text-texto-opaco text-[16px] font-normal">%</span></p>
                    <p class="flex items-center gap-1 mt-2.5 text-status-verde text-[12px]">Sua média geral</p>
                </div>

                <div class="relative overflow-hidden p-5 bg-fundo-card border border-linha-divisoria rounded-xl shadow-md shadow-black/10 transition-colors duration-200 hover:border-status-amarelo before:absolute before:top-0 before:left-0 before:w-[3px] before:h-full before:bg-status-amarelo before:rounded-l-xl">
                    <p class="mb-3 text-texto-padrao text-[11px] font-semibold tracking-wider uppercase">Lacunas ativas</p>
                    <p class="text-status-amarelo font-mono text-[28px] md:text-[32px] font-bold leading-none"><% if (request.getAttribute("activeGaps") != null) { %>${activeGaps}<% } else { %>0<% } %></p>
                    <p class="flex items-center gap-1 mt-2.5 text-status-amarelo text-[12px]">Assuntos pendentes</p>
                </div>
            </div>

            <div class="p-4 md:p-6 mb-7 bg-fundo-card border border-linha-divisoria rounded-xl shadow-md shadow-black/10">
                <div class="flex flex-col md:flex-row md:items-center justify-between mb-5 gap-3">
                    <div>
                        <p class="text-texto-padrao text-[14px] font-semibold">Desempenho recente</p>
                        <p class="mt-0.5 text-texto-opaco text-[12px]">Acertos e erros por sessão</p>
                    </div>
                    <div class="flex gap-4">
                        <div class="flex items-center gap-1.5 text-texto-padrao text-[12px]"><div class="w-2 h-2 rounded-full bg-status-verde"></div>Acertos</div>
                        <div class="flex items-center gap-1.5 text-texto-padrao text-[12px]"><div class="w-2 h-2 rounded-full bg-status-vermelho"></div>Erros</div>
                    </div>
                </div>
                <div class="relative h-[200px] md:h-[220px]">
                    <canvas id="graficoDesempenho"></canvas>
                </div>
            </div>

            <p class="mb-3.5 text-texto-opaco text-[11px] font-semibold tracking-widest uppercase">Progresso por tópico</p>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                <%
                    List<StudentTopic> topics = (List<StudentTopic>) request.getAttribute("topics");
                    if (topics != null) {
                        for (StudentTopic st : topics) {
                            int total = st.getQtySolvedQuestions();
                            int wrong = st.getQtyWrongQuestions();

                            int percentual;
                            if (total > 0) {
                                percentual = (int) Math.round(((double)(total - wrong) / total) * 100);
                            } else {
                                percentual = 0;
                            }

                            String corStatus;
                            if (percentual >= 70) {
                                corStatus = "bg-status-verde";
                            } else if (percentual >= 50) {
                                corStatus = "bg-status-amarelo";
                            } else {
                                corStatus = "bg-status-vermelho";
                            }
                %>
                <div class="flex items-center gap-3.5 p-4 bg-fundo-card border border-linha-divisoria rounded-[10px] shadow-sm shadow-black/5 transition-colors duration-200 hover:border-marca-kairos">
                    <div class="flex shrink-0 items-center justify-center w-9 h-9 bg-marca-kairos/15 rounded-lg text-[16px] font-bold">#</div>
                    <div class="flex-1">
                        <p class="mb-1 text-[13px] font-semibold"><%= st.getTopic().getName() %></p>
                        <p class="text-texto-opaco text-[11px]"><%= total %> questões  <%= percentual %>% de acerto</p>
                        <div class="h-1 mt-1.5 bg-fundo-hover rounded-full overflow-hidden">
                            <div class="h-full <%= corStatus %> rounded-full transition-all duration-700" style="width:<%= percentual %>%"></div>
                        </div>
                    </div>
                </div>
                <%      }
                }
                %>
            </div>
        </section>
        <% } %>

        <% if ("moderator".equals(roleSidebar) || "admin".equals(roleSidebar)) { %>
        <section id="secao-moderador">
            <div class="p-5 bg-fundo-card border border-linha-divisoria rounded-xl shadow-md text-texto-opaco">
                <p>Clique em um dos botões do menu lateral para acessar as ferramentas</p>
            </div>
        </section>
        <% } %>

    </main>
</div>

<script>
    const userType = "<%= roleSidebar %>";
    const userName = "${user.name}";

    function obterIniciais(nome) {
        if(!nome) return "--";
        return nome.split(" ").map(n => n[0]).slice(0,2).join("").toUpperCase();
    }

    if(userType) {
        document.getElementById("badge-papel").textContent = userType.charAt(0).toUpperCase() + userType.slice(1);
    }

    const grafic = document.getElementById("graficoDesempenho");
    if (grafic) {
        let labelsDias = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"];
        let dadosAcertos = [0, 0, 0, 0, 0, 0, 0];
        let dadosErros = [0, 0, 0, 0, 0, 0, 0];

        <%
            Map<String, int[]> weeklyData = (Map<String, int[]>) request.getAttribute("weeklyData");
            if (weeklyData != null && !weeklyData.isEmpty()) {
                int i = 0;
                for (Map.Entry<String, int[]> entry : weeklyData.entrySet()) {
                    if (i < 7) {
        %>
        labelsDias[<%= i %>] = "<%= entry.getKey() %>";
        dadosAcertos[<%= i %>] = <%= entry.getValue()[0] %>;
        dadosErros[<%= i %>] = <%= entry.getValue()[1] %>;
        <%
                        i++;
                    }
                }
            }
        %>

        new Chart(grafic, {
            type: "bar",
            data: {
                labels: labelsDias,
                datasets: [
                    { label: 'Acertos', data: dadosAcertos, backgroundColor: "#22c55e", borderRadius: 4 },
                    { label: 'Erros', data: dadosErros, backgroundColor: "#E16144", borderRadius: 4 }
                ]
            },
            options: {
                responsive: true, maintainAspectRatio: false,
                plugins: { legend: { display: false } },
                scales: {
                    x: { grid: { color: "rgba(255,255,255,.05)" }, ticks: { color: "#8494b0", font: { family: "Sora", size: 11 } } },
                    y: { grid: { color: "rgba(255,255,255,.05)" }, ticks: { color: "#8494b0", font: { family: "Sora", size: 11 } } }
                }
            }
        });
    }
</script>
</body>
</html>