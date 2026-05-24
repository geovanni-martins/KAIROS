<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kairos - Painel de Moderador</title>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
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
            --color-status-vermelho: #E16144;
            --font-sora: "Sora", sans-serif;
            --font-mono: "JetBrains Mono", monospace;
        }
    </style>
     <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/icons/favicon.png">
</head>
<body class="min-h-screen bg-fundo-geral text-texto-padrao font-sora flex flex-col md:flex-row">

<%@include file="nav.jsp"%>

<main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto flex items-center justify-center">

    <div class="w-full max-w-4xl">
        <header class="mb-10 text-center">
            <p class="text-marca-kairos text-[11px] font-semibold tracking-widest uppercase mb-2">Moderação</p>
            <h1 class="text-[28px] md:text-[32px] font-bold">Painel de Ferramentas</h1>
        </header>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-5 md:gap-6">

            <a href="${pageContext.request.contextPath}/manageQuestions" class="group flex flex-col items-center text-center p-8 bg-fundo-card border border-linha-divisoria rounded-2xl shadow-lg transition-all duration-300 hover:-translate-y-2 hover:border-marca-kairos hover:shadow-marca-kairos/10">
                <div class="w-16 h-16 rounded-full bg-marca-kairos/10 flex items-center justify-center text-marca-kairos mb-5 transition-colors duration-300 group-hover:bg-marca-kairos group-hover:text-white">
                    <svg class="w-7 h-7" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M12 8v8M8 12h8"/></svg>
                </div>
                <h2 class="text-texto-padrao text-[16px] font-bold mb-2">Gerenciar Questões</h2>
                <p class="text-texto-opaco text-[12px] leading-relaxed">Liste, exclua ou adicione novas perguntas ao banco de questões.</p>
            </a>

            <a href="${pageContext.request.contextPath}/createTopic" class="group flex flex-col items-center text-center p-8 bg-fundo-card border border-linha-divisoria rounded-2xl shadow-lg transition-all duration-300 hover:-translate-y-2 hover:border-marca-kairos hover:shadow-marca-kairos/10">
                <div class="w-16 h-16 rounded-full bg-marca-kairos/10 flex items-center justify-center text-marca-kairos mb-5 transition-colors duration-300 group-hover:bg-marca-kairos group-hover:text-white">
                    <svg class="w-7 h-7" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M4 6h16M4 12h16M4 18h7"/></svg>
                </div>
                <h2 class="text-texto-padrao text-[16px] font-bold mb-2">Gerenciar Tópicos</h2>
                <p class="text-texto-opaco text-[12px] leading-relaxed">Gerencie as matérias, exclua ou crie novos assuntos no sistema.</p>
            </a>

            <a href="${pageContext.request.contextPath}/reports" class="group flex flex-col items-center text-center p-8 bg-fundo-card border border-linha-divisoria rounded-2xl shadow-lg transition-all duration-300 hover:-translate-y-2 hover:border-status-vermelho hover:shadow-status-vermelho/10">
                <div class="w-16 h-16 rounded-full bg-status-vermelho/10 flex items-center justify-center text-status-vermelho mb-5 transition-colors duration-300 group-hover:bg-status-vermelho group-hover:text-white">
                    <svg class="w-7 h-7" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0zM12 9v4M12 17h.01"/></svg>
                </div>
                <h2 class="text-texto-padrao text-[16px] font-bold mb-2">Ver Reports</h2>
                <p class="text-texto-opaco text-[12px] leading-relaxed">Analise e resolva problemas em questões reportadas pelos alunos</p>
            </a>

        </div>
    </div>
</main>
</body>
</html>