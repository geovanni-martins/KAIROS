<%--
  Created by IntelliJ IDEA.
  User: geovanni
  Date: 05/05/2026
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kairos - Cadastrar Admin</title>
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
            --color-status-vermelho: #E16144;
            --font-sora: "Sora", sans-serif;
            --font-mono: "JetBrains Mono", monospace;
        }
    </style>
</head>
<body class="min-h-screen bg-fundo-geral text-texto-padrao font-sora flex flex-col md:flex-row">

<%@include file="nav.jsp"%>

<main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto flex flex-col items-start">

    <a href="${pageContext.request.contextPath}/admin-panel" class="self-start mb-6 inline-flex items-center gap-2 text-texto-padrao hover:text-marca-kairos transition-colors">
        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
        Voltar
    </a>

    <div class="w-full max-w-3xl mx-auto">
        <header class="mb-8">
            <p class="text-marca-kairos text-[11px] font-semibold tracking-widest uppercase mb-1">Administração</p>
            <h1 class="text-[24px] md:text-[26px] font-bold">Cadastrar Administrador</h1>
            <p class="text-texto-opaco text-[12px] md:text-[13px] mt-1">Preencha os dados do novo administrador do sistema</p>
        </header>

        <% if ("true".equals(request.getParameter("success"))) { %>
        <div id="success-alert" class="flex items-center gap-3 mb-6 p-4 bg-status-verde/10 border border-status-verde/30 rounded-xl text-status-verde text-[13px] font-semibold transition-opacity duration-500">
            Administrador cadastrado com sucesso!
        </div>
        <% } %>

        <% if (request.getAttribute("erro") != null) { %>
        <div class="flex items-center gap-3 mb-6 p-4 bg-status-vermelho/10 border border-status-vermelho/30 rounded-xl text-status-vermelho text-[13px] font-semibold">
            <%= request.getAttribute("erro") %>
        </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/admin/createAdmin" method="POST" class="space-y-5 md:space-y-6">

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="space-y-2">
                    <label class="block text-[11px] font-semibold tracking-widest uppercase text-texto-opaco">Nome</label>
                    <input type="text" name="name" required placeholder="Nome completo"
                           class="w-full px-4 py-3 bg-fundo-card border border-linha-divisoria rounded-xl text-[13px] text-texto-padrao outline-none focus:border-marca-kairos transition-colors">
                </div>
                <div class="space-y-2">
                    <label class="block text-[11px] font-semibold tracking-widest uppercase text-texto-opaco">E-mail</label>
                    <input type="email" name="email" required placeholder="email@exemplo.com"
                           class="w-full px-4 py-3 bg-fundo-card border border-linha-divisoria rounded-xl text-[13px] text-texto-padrao outline-none focus:border-marca-kairos transition-colors">
                </div>
            </div>

            <div class="space-y-2">
                <label class="block text-[11px] font-semibold tracking-widest uppercase text-texto-opaco">Senha</label>
                <input type="password" name="password" required placeholder="Senha inicial"
                       class="w-full px-4 py-3 bg-fundo-card border border-linha-divisoria rounded-xl text-[13px] text-texto-padrao outline-none focus:border-marca-kairos transition-colors">
            </div>

            <div class="p-4 bg-marca-kairos/5 border border-marca-kairos/20 rounded-xl">
                <p class="text-[12px] text-texto-opaco leading-relaxed">
                    <span class="text-marca-kairos font-semibold">Atenção:</span> Administradores têm acesso total ao sistema, incluindo criação de outros usuários e gerenciamento geral. Certifique-se de que esta pessoa deve ter esse nível de acesso.
                </p>
            </div>

            <div class="flex justify-end pt-4">
                <button type="submit"
                        class="w-full md:w-auto px-8 py-3.5 md:py-3 bg-gradient-to-r from-marca-kairos to-marca-escuro text-white text-[14px] font-semibold rounded-xl hover:opacity-90 active:scale-[.98] transition-all">
                    Cadastrar administrador
                </button>
            </div>

        </form>
    </div>

    <script>
        const alert = document.getElementById('success-alert');
        if (alert) {
            setTimeout(() => {
                alert.style.opacity = '0';
                setTimeout(() => alert.remove(), 500);
            }, 3000);
        }
    </script>
</main>
</body>
</html>
