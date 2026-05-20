<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reportar Erro | Kairos</title>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <style type="text/tailwindcss">
        @theme {
            --color-fundo-geral: #0B101E;
            --color-fundo-card: #161F35;
            --color-linha-divisoria: #1D2B48;
            --color-marca-kairos: #E16144;
            --color-status-vermelho: #E16144;
            --color-texto-padrao: #ffffff;
            --color-texto-opaco: #8494b0;
            --font-sora: "Sora", sans-serif;
        }
    </style>
</head>
<body class="min-h-screen bg-fundo-geral text-texto-padrao font-sora flex flex-col md:flex-row">

<%@include file="nav.jsp"%>

<main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 flex items-center justify-center">

    <div class="w-full max-w-2xl bg-fundo-card border border-linha-divisoria rounded-2xl shadow-lg p-6 md:p-10">

        <div class="flex items-center gap-3 mb-6 border-b border-linha-divisoria pb-4">
            <div class="w-10 h-10 rounded-full bg-status-vermelho/10 flex items-center justify-center text-status-vermelho">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
            </div>
            <div>
                <h1 class="text-[20px] font-bold text-status-vermelho">Reportar Problema</h1>
                <p class="text-[12px] text-texto-opaco">Ajude-nos a melhorar o banco de questões</p>
            </div>
        </div>

        <div class="mb-6">
            <p class="text-[11px] text-texto-opaco uppercase font-bold tracking-wider mb-2">Questão Selecionada:</p>
            <div class="bg-fundo-geral p-4 rounded-xl border border-linha-divisoria">
                <p class="text-[13px] leading-relaxed">${question.statement}</p>
            </div>
        </div>

        <form action="${pageContext.request.contextPath}/reportQuestion" method="POST" class="space-y-6">
            <input type="hidden" name="questionId" value="${question.id}">
            <input type="hidden" name="topicId" value="${topicId}">

            <div>
                <label for="reason" class="block text-[13px] font-bold text-texto-padrao mb-2">Qual é o problema com esta questão?</label>
                <textarea id="reason" name="reason" rows="4" placeholder="Ex: A alternativa correta não está entre as opções, o enunciado está faltando dados importantes..." required class="w-full px-4 py-3 bg-fundo-geral border border-linha-divisoria rounded-xl text-[13px] text-texto-padrao outline-none focus:border-status-vermelho transition-colors resize-none"></textarea>
            </div>

            <div class="flex flex-col-reverse md:flex-row justify-end gap-3 pt-4">
                <a href="${pageContext.request.contextPath}/questions?topicId=${topicId}" class="px-6 py-3 text-[13px] font-bold text-texto-opaco hover:text-white text-center transition-colors">
                    Cancelar
                </a>
                <button type="submit" class="px-6 py-3 bg-status-vermelho/10 text-status-vermelho border border-status-vermelho/30 rounded-xl text-[13px] font-bold hover:bg-status-vermelho hover:text-white transition-all active:scale-[.98]">
                    Enviar Denúncia
                </button>
            </div>
        </form>

    </div>

</main>
</body>
</html>