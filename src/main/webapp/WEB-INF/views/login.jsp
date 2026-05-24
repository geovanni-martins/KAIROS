<%--
  Created by IntelliJ IDEA.
  User: geovanni
  Date: 27/04/2026
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap');

        :root {
            --font-principal: 'Inter', sans-serif;
            --color-principal: #1D2B48;
            --color-principal-sec: #161F35;
            --color-sec: #E16144;
            --color-sec-sec: #C9523A;
            --color-text: #E8EDF8;
        }

        body {
            margin: 0;
            font-family: var(--font-principal);
            color: var(--color-text);
        }

        #alert-erro {
            transition: opacity 0.3s ease;
        }

        ::placeholder {
            color: rgba(232, 237, 248, 0.48);
        }
    </style>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/icons/favicon.png">
</head>
<body class="min-h-screen bg-[var(--color-principal-sec)] text-slate-100">

<%
    String erro = (String) request.getAttribute("erro");
%>

<% if (erro != null) { %>
<div id="alert-erro" class="mb-4 flex items-center justify-between rounded-xl bg-red-500/20 border border-red-500/40 text-red-300 px-4 py-3 text-sm">

    <span><%= erro %></span>

    <button onclick="fecharAlerta('alert-erro')" class="ml-4 text-red-300 hover:text-white text-lg font-bold">
        &times;
    </button>
</div>
<% } %>

<main class="min-h-screen flex items-center justify-center px-4 py-8">
    <section class="w-full max-w-lg rounded-[28px] border border-white/10 bg-slate-900/90 p-6 shadow-[0_25px_80px_rgba(0,0,0,0.35)] backdrop-blur-xl sm:p-8">
        <form action="${pageContext.request.contextPath}/login" method="post" class="space-y-6">
            <div class="space-y-2">
                <label for="email" class="block text-sm font-semibold tracking-[0.18em] text-slate-400">Email</label>
                <input id="email" name="email" type="email" minlength="8" maxlength="100" required placeholder="aluno@kairos.com.br"
                       class="w-full rounded-2xl border border-slate-700 bg-slate-900/90 px-4 py-3 text-sm text-slate-100 outline-none transition duration-200 focus:border-orange-400 focus:ring-2 focus:ring-orange-400/20">
            </div>

            <div class="space-y-2">
                <label for="password" class="block text-sm font-semibold tracking-[0.18em] text-slate-400">Senha</label>
                <input id="password" name="password" type="password" minlength="8" maxlength="70" required placeholder="••••••••"
                       class="w-full rounded-2xl border border-slate-700 bg-slate-900/90 px-4 py-3 text-sm text-slate-100 outline-none transition duration-200 focus:border-orange-400 focus:ring-2 focus:ring-orange-400/20">
            </div>

            <button type="submit" class="flex w-full items-center justify-center rounded-2xl bg-[var(--color-sec)] px-4 py-3 text-sm font-semibold text-slate-100 transition duration-200 hover:bg-[var(--color-sec-sec)]">
                Entrar
            </button>
        </form>

        <div class="mt-6 border-t border-white/10 pt-5 text-center text-sm text-slate-200">
            <span>Não possui conta? </span><a href="${pageContext.request.contextPath}/register" class="font-semibold text-[var(--color-sec)] hover:text-[var(--color-sec-sec)]">Criar conta</a>
            <br>
            <a href="${pageContext.request.contextPath}/new-password" class="font-semibold text-[var(--color-sec)] hover:text-[var(--color-sec-sec)]">Mudar senha</a>
        </div>
    </section>
</main>

</body>

<script>
    function fecharAlerta(id) {
        const el = document.getElementById(id);
        if (el) {
            el.style.opacity = '0';
            setTimeout(() => el.remove(), 300);
        }
    }
</script>

</html>

