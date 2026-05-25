<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
    <%@ include file="styles.jsp" %>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/favicon.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body class="flex min-h-screen bg-background text-content font-sora">

<div class="flex flex-col md:flex-row w-full min-h-screen">

    <%@include file="nav.jsp"%>

    <main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto">

        <header class="flex items-start justify-between mb-6 md:mb-9">
            <div>
                <p class="mb-1 text-brand text-[11px] md:text-[12px] font-semibold tracking-widest uppercase">Bem-vindo(a)</p>
                <h1 id="user-name-title" class="text-content text-[22px] md:text-[26px] font-bold">${user.name}</h1>
                <p id="welcome-subtitle" class="mt-1 text-muted text-[12px] md:text-[13px]">
                    <% if ("student".equals(roleSidebar)) { %>
                    Continue de onde parou, você está indo bem
                    <% } else { %>
                    Gerencie o conteúdo do sistema
                    <% } %>
                </p>
            </div>
            <div class="flex items-center">
                <span id="role-badge" class="px-3 py-1.5 bg-brand/15 rounded-full text-brand text-[10px] md:text-[11px] font-semibold tracking-wide uppercase">...</span>
            </div>
        </header>

        <% if ("student".equals(roleSidebar)) { %>
        <section id="student-section">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-7">
                <div class="relative overflow-hidden p-5 bg-surface border border-divider rounded-xl shadow-md shadow-black/10 transition-colors duration-200 hover:border-brand before:absolute before:top-0 before:left-0 before:w-[3px] before:h-full before:bg-brand before:rounded-l-xl">
                    <p class="mb-3 text-content text-[11px] font-semibold tracking-wider uppercase">Questões respondidas</p>
                    <p class="text-content font-mono text-[28px] md:text-[32px] font-bold leading-none"><% if (request.getAttribute("solvedQuestions") != null) { %>${solvedQuestions}<% } else { %>0<% } %></p>
                    <p class="flex items-center gap-1 mt-2.5 text-success text-[12px]">Foco na meta!</p>
                </div>

                <div class="relative overflow-hidden p-5 bg-surface border border-divider rounded-xl shadow-md shadow-black/10 transition-colors duration-200 hover:border-brand before:absolute before:top-0 before:left-0 before:w-[3px] before:h-full before:bg-brand before:rounded-l-xl">
                    <p class="mb-3 text-content text-[11px] font-semibold tracking-wider uppercase">Percentual de acertos</p>
                    <p class="text-content font-mono text-[28px] md:text-[32px] font-bold leading-none"><% if (request.getAttribute("percentageCorrectAnswers") != null) { %>${percentageCorrectAnswers}<% } else { %>0<% } %><span class="text-muted text-[16px] font-normal">%</span></p>
                    <p class="flex items-center gap-1 mt-2.5 text-success text-[12px]">Sua média geral</p>
                </div>

                <div class="relative overflow-hidden p-5 bg-surface border border-divider rounded-xl shadow-md shadow-black/10 transition-colors duration-200 hover:border-warning before:absolute before:top-0 before:left-0 before:w-[3px] before:h-full before:bg-warning before:rounded-l-xl">
                    <p class="mb-3 text-content text-[11px] font-semibold tracking-wider uppercase">Lacunas ativas</p>
                    <p class="text-warning font-mono text-[28px] md:text-[32px] font-bold leading-none"><% if (request.getAttribute("activeGaps") != null) { %>${activeGaps}<% } else { %>0<% } %></p>
                    <p class="flex items-center gap-1 mt-2.5 text-warning text-[12px]">Assuntos pendentes</p>
                </div>
            </div>

            <div class="p-4 md:p-6 mb-7 bg-surface border border-divider rounded-xl shadow-md shadow-black/10">
                <div class="flex flex-col md:flex-row md:items-center justify-between mb-5 gap-3">
                    <div>
                        <p class="text-content text-[14px] font-semibold">Desempenho recente</p>
                        <p class="mt-0.5 text-muted text-[12px]">Acertos e erros por sessão</p>
                    </div>
                    <div class="flex gap-4">
                        <div class="flex items-center gap-1.5 text-content text-[12px]"><div class="w-2 h-2 rounded-full bg-success"></div>Acertos</div>
                        <div class="flex items-center gap-1.5 text-content text-[12px]"><div class="w-2 h-2 rounded-full bg-danger"></div>Erros</div>
                    </div>
                </div>
                <div class="relative h-[200px] md:h-[220px]">
                    <canvas id="performance-chart"></canvas>
                </div>
            </div>

            <p class="mb-3.5 text-muted text-[11px] font-semibold tracking-widest uppercase">Progresso por tópico</p>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-3">
                <%
                    List<StudentTopic> topics = (List<StudentTopic>) request.getAttribute("topics");
                    if (topics != null) {
                        for (StudentTopic st : topics) {
                            int total = st.getQtySolvedQuestions();
                            int wrong = st.getQtyWrongQuestions();

                            int percentage;
                            if (total > 0) {
                                percentage = (int) Math.round(((double)(total - wrong) / total) * 100);
                            } else {
                                percentage = 0;
                            }

                            String statusColor;
                            if (percentage >= 70) {
                                statusColor = "bg-success";
                            } else if (percentage >= 50) {
                                statusColor = "bg-warning";
                            } else {
                                statusColor = "bg-danger";
                            }
                %>
                <div class="flex items-center gap-3.5 p-4 bg-surface border border-divider rounded-[10px] shadow-sm shadow-black/5 transition-colors duration-200 hover:border-brand">
                    <div class="flex shrink-0 items-center justify-center w-9 h-9 bg-brand/15 rounded-lg text-[16px] font-bold">#</div>
                    <div class="flex-1">
                        <p class="mb-1 text-[13px] font-semibold"><%= st.getTopic().getName() %></p>
                        <p class="text-muted text-[11px]"><%= total %> questões  <%= percentage %>% de acerto</p>
                        <div class="h-1 mt-1.5 bg-surface-hover rounded-full overflow-hidden">
                            <div class="h-full <%= statusColor %> rounded-full transition-all duration-700" style="width:<%= percentage %>%"></div>
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
        <section id="moderator-section">
            <div class="p-5 bg-surface border border-divider rounded-xl shadow-md text-muted">
                <p>Clique em um dos botões do menu lateral para acessar as ferramentas</p>
            </div>
        </section>
        <% } %>

    </main>
</div>

<script>
    const userType = "<%= roleSidebar %>";
    const userName = "${user.name}";
    const themeStyles = getComputedStyle(document.documentElement);
    const successColor = themeStyles.getPropertyValue('--color-success').trim();
    const dangerColor = themeStyles.getPropertyValue('--color-danger').trim();

    function getInitials(name) {
        if(!name) return "--";
        return name.split(" ").map(n => n[0]).slice(0,2).join("").toUpperCase();
    }

    if(userType) {
        document.getElementById("role-badge").textContent = userType.charAt(0).toUpperCase() + userType.slice(1);
    }

    const chartCanvas = document.getElementById("performance-chart");
    if (chartCanvas) {
        let dayLabels = [
            <%
            String[] days = (String[]) request.getAttribute("dayLabels");
            if (days != null) {
                for(int i = 0; i < 7; i++) {
                    out.print("'" + days[i] + "'");
                    if (i < 6) {
                        out.print(",");
                    }
                }
            }
            %>
        ];

        let correctAnswerData = [
            <%
            int[] correctAnswers = (int[]) request.getAttribute("correctAnswerData");
            if (correctAnswers != null) {
                for(int i = 0; i < 7; i++) {
                    out.print(correctAnswers[i]);
                    if (i < 6) {
                        out.print(",");
                    }
                }
            }
            %>
        ];

        let wrongAnswerData = [
            <%
            int[] wrongAnswers = (int[]) request.getAttribute("wrongAnswerData");
            if (wrongAnswers != null) {
                for(int i = 0; i < 7; i++) {
                    out.print(wrongAnswers[i]);
                    if (i < 6) {
                        out.print(",");
                    }
                }
            }
            %>
        ];

        new Chart(chartCanvas, {
            type: "bar",
            data: {
                labels: dayLabels,
                datasets: [
                    { label: 'Acertos', data: correctAnswerData, backgroundColor: successColor, borderRadius: 4 },
                    { label: 'Erros', data: wrongAnswerData, backgroundColor: dangerColor, borderRadius: 4 }
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
