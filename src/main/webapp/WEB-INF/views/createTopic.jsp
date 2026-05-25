<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.kairos.model.Topic, java.util.List" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kairos - Criar e Gerenciar Tópicos</title>
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
     <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/icons/favicon.png">
</head>
<body class="min-h-screen bg-fundo-geral text-texto-padrao font-sora flex flex-col md:flex-row">

<%@include file="nav.jsp"%>

<main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto flex flex-col items-start">

    <a href="${pageContext.request.contextPath}/moderator-panel" class="self-start mb-6 inline-flex items-center gap-2 text-texto-padrao hover:text-marca-kairos transition-colors">
        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
        Voltar
    </a>

    <div class="w-full max-w-3xl mx-auto">
        <header class="mb-8">
            <p class="text-marca-kairos text-[11px] font-semibold tracking-widest uppercase mb-1">Moderação</p>
            <h1 class="text-[24px] md:text-[26px] font-bold">Gerenciar Tópicos</h1>
            <p class="text-texto-opaco text-[12px] md:text-[13px] mt-1">Crie novos tópicos ou remova os existentes.</p>
        </header>

        <% if ("true".equals(request.getParameter("success"))) { %>
        <div id="alert-msg" class="flex items-center gap-3 mb-6 p-4 bg-status-verde/10 border border-status-verde/30 rounded-xl text-status-verde text-[13px] font-semibold transition-opacity duration-500">
            Tópico criado com sucesso
        </div>
        <% } %>

        <% if ("true".equals(request.getParameter("deleted"))) { %>
        <div id="alert-msg" class="flex items-center gap-3 mb-6 p-4 bg-status-vermelho/10 border border-status-vermelho/30 rounded-xl text-status-vermelho text-[13px] font-semibold transition-opacity duration-500">
            Tópico excluído com sucesso!
        </div>
        <% } %>

        <% if (request.getAttribute("erro") != null) { %>
        <div class="flex items-center gap-3 mb-6 p-4 bg-status-amarelo/10 border border-status-amarelo/30 rounded-xl text-status-amarelo text-[13px] font-semibold">
            <%= request.getAttribute("erro") %>
        </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/createTopic" method="POST" class="space-y-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="space-y-2">
                    <label class="block text-[11px] font-semibold tracking-widest uppercase text-texto-opaco">Nome do Tópico</label>
                    <input type="text" name="name" required placeholder="Ex: Frações, Matrizes..."
                           class="w-full px-4 py-3 bg-fundo-card border border-linha-divisoria rounded-xl text-[13px] text-texto-padrao outline-none focus:border-marca-kairos transition-colors">
                </div>

                <div class="space-y-2">
                    <label class="block text-[11px] font-semibold tracking-widest uppercase text-texto-opaco">Matéria</label>
                    <select name="subject" required
                            class="w-full px-4 py-3 bg-fundo-card border border-linha-divisoria rounded-xl text-[13px] text-texto-padrao outline-none focus:border-marca-kairos transition-colors">
                        <option value="MATH">Matemática</option>
                    </select>
                </div>
            </div>

            <div class="space-y-3 pt-2 border-t border-linha-divisoria">
                <label class="block text-[11px] font-semibold tracking-widest uppercase text-texto-opaco">Pré-requisitos</label>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-3 max-h-[200px] overflow-y-auto pr-2 custom-scrollbar">
                    <%
                        List<Topic> topics = (List<Topic>) request.getAttribute("topics");
                        if (topics != null && !topics.isEmpty()) {
                            for (Topic t : topics) {
                    %>
                    <label class="flex items-center gap-3 p-3 bg-fundo-card border border-linha-divisoria rounded-xl cursor-pointer transition-colors hover:border-marca-kairos has-[:checked]:border-marca-kairos has-[:checked]:bg-marca-kairos/8">
                        <input type="checkbox" name="preReqs" value="<%= t.getId() %>" class="w-4 h-4 text-marca-kairos bg-fundo-geral border-linha-divisoria rounded focus:ring-marca-kairos focus:ring-offset-fundo-card">
                        <span class="text-[13px] text-texto-padrao truncate"><%= t.getName() %></span>
                    </label>
                    <%      }
                    } else { %>
                    <p class="text-[12px] text-texto-opaco col-span-2 p-4 text-center">Nenhum tópico cadastrado ainda.</p>
                    <%  } %>
                </div>
            </div>

            <div class="flex justify-end pt-4">
                <button type="submit" class="w-full md:w-auto px-8 py-3 bg-gradient-to-r from-marca-kairos to-marca-escuro text-white text-[14px] font-semibold rounded-xl transition-all hover:opacity-90 active:scale-[.98]">
                    Criar tópico
                </button>
            </div>
        </form>

        <div class="mt-12 pt-8 border-t border-linha-divisoria">
            <h2 class="text-[18px] font-bold mb-4">Tópicos Cadastrados</h2>
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <% if (topics != null && !topics.isEmpty()) {
                    for (Topic t : topics) { %>
                <div class="flex items-center justify-between p-4 bg-fundo-card border border-linha-divisoria rounded-xl shadow-sm hover:border-status-vermelho/50 transition-colors">
                    <div class="flex flex-col">
                        <span class="text-[14px] font-semibold truncate"><%= t.getName() %></span>
                        <span class="text-[11px] text-texto-opaco mt-0.5">ID: <%= t.getId() %> | <%= t.getSubject() %></span>
                    </div>

                    <form id="form-delete-topic-<%= t.getId() %>" action="${pageContext.request.contextPath}/deleteTopic" method="POST">
                        <input type="hidden" name="topicId" value="<%= t.getId() %>">
                        <button type="button" onclick="abrirModal(<%= t.getId() %>, '<%= t.getName().replace("'", "\\'") %>')" class="p-2 text-texto-opaco hover:text-white hover:bg-status-vermelho rounded-lg transition-all" title="Excluir Tópico">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                        </button>
                    </form>
                </div>
                <%  }
                } else { %>
                <p class="text-[13px] text-texto-opaco col-span-2">Nenhum tópico para gerenciar</p>
                <% } %>
            </div>
        </div>

    </div>

    <div id="modal-exclusao" class="fixed inset-0 z-50 hidden items-center justify-center bg-black/60 backdrop-blur-sm transition-opacity duration-300 opacity-0">
        <div id="modal-conteudo" class="bg-fundo-card border border-linha-divisoria rounded-2xl shadow-2xl p-6 w-[90%] max-w-md transform scale-95 transition-transform duration-300">

            <div class="flex items-center gap-3 mb-4 text-status-vermelho">
                <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
                <h2 class="text-[20px] font-bold text-white">Excluir Tópico</h2>
            </div>

            <p class="text-texto-opaco text-[14px] mb-6 leading-relaxed">
                Você tem certeza absoluta que deseja excluir o tópico <strong class="text-white" id="texto-nome-topico">Tópico</strong>?<br>
                Todas as questões vinculadas a ele <span class="text-status-vermelho font-semibold">também serão apagadas</span>.
            </p>

            <div class="flex justify-end gap-3">
                <button onclick="fecharModal()" class="px-5 py-2.5 rounded-xl text-[13px] font-semibold text-texto-opaco bg-fundo-geral border border-linha-divisoria hover:text-white hover:bg-fundo-hover transition-colors">
                    Cancelar
                </button>
                <button id="btn-confirmar-exclusao" class="px-5 py-2.5 rounded-xl text-[13px] font-semibold text-white bg-status-vermelho hover:bg-opacity-80 transition-colors">
                    Sim, excluir
                </button>
            </div>

        </div>
    </div>

    <script>
        const alertMsg = document.getElementById('alert-msg');
        if (alertMsg) {
            setTimeout(function() {
                alertMsg.style.opacity = '0';
                setTimeout(function() { alertMsg.remove(); }, 500);
            }, 3000);
        }

        let formTopicParaEnviar = null;
        const modal = document.getElementById('modal-exclusao');
        const modalConteudo = document.getElementById('modal-conteudo');

        function abrirModal(idTopico, nomeTopico) {
            formTopicParaEnviar = 'form-delete-topic-' + idTopico;
            document.getElementById('texto-nome-topico').innerText = '"' + nomeTopico + '"';

            modal.classList.remove('hidden');
            modal.classList.add('flex');

            setTimeout(function() {
                modal.classList.remove('opacity-0');
                modalConteudo.classList.remove('scale-95');
                modalConteudo.classList.add('scale-100');
            }, 10);
        }

        function fecharModal() {
            modal.classList.add('opacity-0');
            modalConteudo.classList.remove('scale-100');
            modalConteudo.classList.add('scale-95');

            setTimeout(function() {
                modal.classList.remove('flex');
                modal.classList.add('hidden');
                formTopicParaEnviar = null;
            }, 300);
        }

        document.getElementById('btn-confirmar-exclusao').addEventListener('click', function() {
            if (formTopicParaEnviar !== null) {
                document.getElementById(formTopicParaEnviar).submit();
            }
        });
    </script>
</main>
</body>
</html>