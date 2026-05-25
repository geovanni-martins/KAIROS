<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kairos - Configurações</title>
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
            --color-status-verde: #22c55e;
            --color-status-vermelho: #E16144;
            --font-sora: "Sora", sans-serif;
            --font-mono: "JetBrains Mono", monospace;
        }
    </style>
     <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/icons/favicon.png">
</head>
<body class="min-h-screen bg-fundo-geral text-texto-padrao font-sora flex flex-col md:flex-row">

<%@include file="nav.jsp"%>

<main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto">
    <div class="max-w-4xl mx-auto">

        <header class="mb-10">
            <p class="text-marca-kairos text-[11px] font-semibold tracking-widest uppercase mb-2">Conta</p>
            <h1 class="text-[28px] md:text-[32px] font-bold">Configurações</h1>
        </header>

        <%-- Mensagens de feedback --%>
        <% if (request.getAttribute("successMessage") != null) { %>
        <div class="mb-6 p-4 bg-status-verde/10 border border-status-verde/30 rounded-xl text-status-verde text-[13px] font-semibold">
            ✓ ${successMessage}
        </div>
        <% } %>
        <% if (request.getAttribute("errorMessage") != null) { %>
        <div class="mb-6 p-4 bg-marca-kairos/10 border border-marca-kairos/30 rounded-xl text-marca-kairos text-[13px] font-semibold">
            ✕ ${errorMessage}
        </div>
        <% } %>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-5 md:gap-6">

            <%-- Card: Perfil --%>
            <div class="p-6 bg-fundo-card border border-linha-divisoria rounded-2xl shadow-lg">
                <div class="w-13 h-13 bg-marca-kairos rounded-full flex items-center justify-center text-white text-xl font-bold mb-4">
                    ${user.name.substring(0,1).toUpperCase()}
                </div>
                <span class="inline-block px-3 py-1 bg-marca-kairos/15 text-marca-kairos rounded-full text-[11px] font-semibold tracking-wide uppercase mb-3">${user.role}</span>
                <p class="text-[15px] font-bold">${user.name}</p>
                <p class="text-texto-opaco text-[12px] mb-4">${user.email}</p>
                <div class="border-t border-linha-divisoria pt-4 space-y-2">
                    <div class="flex justify-between text-[13px]">
                        <span class="text-texto-opaco">ID</span>
                        <span class="font-mono">#${user.id}</span>
                    </div>
                    <div class="flex justify-between text-[13px]">
                        <span class="text-texto-opaco">Função</span>
                        <span class="capitalize">${user.role}</span>
                    </div>
                    <div class="flex justify-between text-[13px]">
                        <span class="text-texto-opaco">Status</span>
                        <span class="text-status-verde">● Ativo</span>
                    </div>
                </div>
            </div>

            <%-- Card: Alterar nome --%>
            <div class="p-6 bg-fundo-card border border-linha-divisoria rounded-2xl shadow-lg">
                <p class="text-[14px] font-bold mb-1">Alterar nome</p>
                <p class="text-texto-opaco text-[12px] mb-5">Atualize como seu nome aparece no sistema</p>
                <form action="${pageContext.request.contextPath}/settings/name" method="post">
                    <label class="block text-texto-opaco text-[11px] font-semibold tracking-widest uppercase mb-1.5">Novo nome</label>
                    <input type="text" name="newName" placeholder="Seu nome completo" value="${user.name}"
                           class="w-full bg-fundo-geral border border-linha-divisoria rounded-xl px-4 py-2.5 text-texto-padrao text-[13px] mb-4 outline-none focus:border-marca-kairos transition-colors">
                    <button type="submit"
                            class="w-full bg-marca-kairos text-white rounded-xl py-2.5 text-[13px] font-semibold hover:opacity-85 transition-opacity">
                        Salvar nome
                    </button>
                </form>
            </div>

            <%-- Card: Alterar e-mail --%>
            <div class="p-6 bg-fundo-card border border-linha-divisoria rounded-2xl shadow-lg">
                <p class="text-[14px] font-bold mb-1">Alterar e-mail</p>
                <p class="text-texto-opaco text-[12px] mb-5">Atualize seu endereço de e-mail de acesso</p>
                <form action="${pageContext.request.contextPath}/settings/email" method="post">
                    <label class="block text-texto-opaco text-[11px] font-semibold tracking-widest uppercase mb-1.5">Novo e-mail</label>
                    <input type="email" name="newEmail" placeholder="novo@email.com" value="${user.email}"
                           class="w-full bg-fundo-geral border border-linha-divisoria rounded-xl px-4 py-2.5 text-texto-padrao text-[13px] mb-4 outline-none focus:border-marca-kairos transition-colors">
                    <button type="submit"
                            class="w-full bg-marca-kairos text-white rounded-xl py-2.5 text-[13px] font-semibold hover:opacity-85 transition-opacity">
                        Salvar e-mail
                    </button>
                </form>
            </div>

            <%-- Card: Alterar senha --%>
            <div class="p-6 bg-fundo-card border border-linha-divisoria rounded-2xl shadow-lg">
                <p class="text-[14px] font-bold mb-1">Alterar senha</p>
                <p class="text-texto-opaco text-[12px] mb-5">Use uma senha forte com ao menos 8 caracteres</p>
                <form action="${pageContext.request.contextPath}/settings/password" method="post">
                    <label class="block text-texto-opaco text-[11px] font-semibold tracking-widest uppercase mb-1.5">Nova senha</label>
                    <input type="password" name="newPassword" placeholder="••••••••"
                           class="w-full bg-fundo-geral border border-linha-divisoria rounded-xl px-4 py-2.5 text-texto-padrao text-[13px] mb-3 outline-none focus:border-marca-kairos transition-colors">
                    <label class="block text-texto-opaco text-[11px] font-semibold tracking-widest uppercase mb-1.5">Confirmar senha</label>
                    <input type="password" name="confirmPassword" placeholder="••••••••"
                           class="w-full bg-fundo-geral border border-linha-divisoria rounded-xl px-4 py-2.5 text-texto-padrao text-[13px] mb-4 outline-none focus:border-marca-kairos transition-colors">
                    <button type="submit"
                            class="w-full bg-marca-kairos text-white rounded-xl py-2.5 text-[13px] font-semibold hover:opacity-85 transition-opacity">
                        Salvar senha
                    </button>
                </form>
            </div>

            <%-- Card: Zona de perigo --%>
            <div class="md:col-span-2 p-6 bg-fundo-card border border-marca-kairos/30 rounded-2xl shadow-lg">
                <p class="text-marca-kairos text-[14px] font-bold mb-1">Zona de perigo</p>
                <p class="text-texto-opaco text-[12px] mb-5">Ações irreversíveis — prossiga com cautela</p>
                <form action="${pageContext.request.contextPath}/settings/delete" method="post"
                      onsubmit="return confirm('Tem certeza? Esta ação não pode ser desfeita.')">
                    <button type="submit"
                            class="px-6 py-2.5 bg-marca-kairos/10 text-marca-kairos border border-marca-kairos/30 rounded-xl text-[13px] font-semibold hover:bg-marca-kairos/20 transition-colors">
                        Excluir minha conta
                    </button>
                </form>
            </div>

        </div>
    </div>
</main>
</body>
</html>