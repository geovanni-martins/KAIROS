<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.kairos.model.Topic, java.util.List" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kairos - Criar e Gerenciar Tópicos</title>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <%@ include file="styles.jsp" %>
    <script src="https://cdn.tailwindcss.com"></script>
     <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/favicon.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body class="min-h-screen bg-background text-content font-sora flex flex-col md:flex-row">

<%@include file="nav.jsp"%>

<main class="flex-1 p-4 pt-16 md:p-9 md:pt-20 overflow-y-auto flex flex-col items-start">

    <a href="${pageContext.request.contextPath}/moderator-panel" class="self-start mb-6 inline-flex items-center gap-2 text-content hover:text-brand transition-colors">
        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M19 12H5M12 19l-7-7 7-7"/></svg>
        Voltar
    </a>

    <div class="w-full max-w-3xl mx-auto">
        <header class="mb-8">
            <p class="text-brand text-[11px] font-semibold tracking-widest uppercase mb-1">Moderação</p>
            <h1 class="text-[24px] md:text-[26px] font-bold">Gerenciar Tópicos</h1>
            <p class="text-muted text-[12px] md:text-[13px] mt-1">Crie novos tópicos ou remova os existentes.</p>
        </header>

        <% if ("true".equals(request.getParameter("success"))) { %>
        <div id="alert-msg" class="flex items-center gap-3 mb-6 p-4 bg-success/10 border border-success/30 rounded-xl text-success text-[13px] font-semibold transition-opacity duration-500">
            Tópico criado com sucesso
        </div>
        <% } %>

        <% if ("true".equals(request.getParameter("deleted"))) { %>
        <div id="alert-msg" class="flex items-center gap-3 mb-6 p-4 bg-danger/10 border border-danger/30 rounded-xl text-danger text-[13px] font-semibold transition-opacity duration-500">
            Tópico excluído com sucesso!
        </div>
        <% } %>

        <% if (request.getAttribute("error") != null) { %>
        <div class="flex items-center gap-3 mb-6 p-4 bg-warning/10 border border-warning/30 rounded-xl text-warning text-[13px] font-semibold">
            <%= request.getAttribute("error") %>
        </div>
        <% } %>

        <form action="${pageContext.request.contextPath}/createTopic" method="POST" class="space-y-6">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="space-y-2">
                    <label class="block text-[11px] font-semibold tracking-widest uppercase text-muted">Nome do Tópico</label>
                    <input type="text" name="name" required placeholder="Ex: Frações, Matrizes..."
                           class="w-full px-4 py-3 bg-surface border border-divider rounded-xl text-[13px] text-content outline-none focus:border-brand transition-colors">
                </div>

                <div class="space-y-2">
                    <label class="block text-[11px] font-semibold tracking-widest uppercase text-muted">Matéria</label>
                    <select name="subject" required
                            class="w-full px-4 py-3 bg-surface border border-divider rounded-xl text-[13px] text-content outline-none focus:border-brand transition-colors">
                        <option value="MATH">Matemática</option>
                    </select>
                </div>
            </div>

            <div class="space-y-3 pt-2 border-t border-divider">
                <label class="block text-[11px] font-semibold tracking-widest uppercase text-muted">Pré-requisitos</label>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-3 max-h-[200px] overflow-y-auto pr-2 custom-scrollbar">
                    <%
                        List<Topic> topics = (List<Topic>) request.getAttribute("topics");
                        if (topics != null && !topics.isEmpty()) {
                            for (Topic t : topics) {
                    %>
                    <label class="flex items-center gap-3 p-3 bg-surface border border-divider rounded-xl cursor-pointer transition-colors hover:border-brand has-[:checked]:border-brand has-[:checked]:bg-brand/8">
                        <input type="checkbox" name="preReqs" value="<%= t.getId() %>" class="w-4 h-4 text-brand bg-background border-divider rounded focus:ring-brand focus:ring-offset-surface">
                        <span class="text-[13px] text-content truncate"><%= t.getName() %></span>
                    </label>
                    <%      }
                    } else { %>
                    <p class="text-[12px] text-muted col-span-2 p-4 text-center">Nenhum tópico cadastrado ainda.</p>
                    <%  } %>
                </div>
            </div>

            <div class="flex justify-end pt-4">
                <button type="submit" class="w-full md:w-auto px-8 py-3 bg-gradient-to-r from-brand to-brand-dark text-white text-[14px] font-semibold rounded-xl transition-all hover:opacity-90 active:scale-[.98]">
                    Criar tópico
                </button>
            </div>
        </form>

        <div class="mt-12 pt-8 border-t border-divider">
            <h2 class="text-[18px] font-bold mb-4">Tópicos Cadastrados</h2>
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <% if (topics != null && !topics.isEmpty()) {
                    for (Topic t : topics) { %>
                <div class="flex items-center justify-between p-4 bg-surface border border-divider rounded-xl shadow-sm hover:border-danger/50 transition-colors">
                    <div class="flex flex-col">
                        <span class="text-[14px] font-semibold truncate"><%= t.getName() %></span>
                        <span class="text-[11px] text-muted mt-0.5">ID: <%= t.getId() %> | <%= t.getSubject() %></span>
                    </div>

                    <form id="form-delete-topic-<%= t.getId() %>" action="${pageContext.request.contextPath}/deleteTopic" method="POST">
                        <input type="hidden" name="topicId" value="<%= t.getId() %>">
                        <button type="button" onclick="openModal(<%= t.getId() %>, '<%= t.getName().replace("'", "\\'") %>')" class="p-2 text-muted hover:text-white hover:bg-danger rounded-lg transition-all" title="Excluir Tópico">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                        </button>
                    </form>
                </div>
                <%  }
                } else { %>
                <p class="text-[13px] text-muted col-span-2">Nenhum tópico para gerenciar</p>
                <% } %>
            </div>
        </div>

    </div>

    <div id="delete-modal" class="fixed inset-0 z-50 hidden items-center justify-center bg-black/60 backdrop-blur-sm transition-opacity duration-300 opacity-0">
        <div id="modal-content" class="bg-surface border border-divider rounded-2xl shadow-2xl p-6 w-[90%] max-w-md transform scale-95 transition-transform duration-300">

            <div class="flex items-center gap-3 mb-4 text-danger">
                <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
                <h2 class="text-[20px] font-bold text-white">Excluir Tópico</h2>
            </div>

            <p class="text-muted text-[14px] mb-6 leading-relaxed">
                Você tem certeza absoluta que deseja excluir o tópico <strong class="text-white" id="topic-name-text">Tópico</strong>?<br>
                Todas as questões vinculadas a ele <span class="text-danger font-semibold">também serão apagadas</span>.
            </p>

            <div class="flex justify-end gap-3">
                <button onclick="closeModal()" class="px-5 py-2.5 rounded-xl text-[13px] font-semibold text-muted bg-background border border-divider hover:text-white hover:bg-surface-hover transition-colors">
                    Cancelar
                </button>
                <button id="confirm-delete-button" class="px-5 py-2.5 rounded-xl text-[13px] font-semibold text-white bg-danger hover:bg-opacity-80 transition-colors">
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

        let topicFormToSubmit = null;
        const modal = document.getElementById('delete-modal');
        const modalContent = document.getElementById('modal-content');

        function openModal(topicId, topicName) {
            topicFormToSubmit = 'form-delete-topic-' + topicId;
            document.getElementById('topic-name-text').innerText = '"' + topicName + '"';

            modal.classList.remove('hidden');
            modal.classList.add('flex');

            setTimeout(function() {
                modal.classList.remove('opacity-0');
                modalContent.classList.remove('scale-95');
                modalContent.classList.add('scale-100');
            }, 10);
        }

        function closeModal() {
            modal.classList.add('opacity-0');
            modalContent.classList.remove('scale-100');
            modalContent.classList.add('scale-95');

            setTimeout(function() {
                modal.classList.remove('flex');
                modal.classList.add('hidden');
                topicFormToSubmit = null;
            }, 300);
        }

        document.getElementById('confirm-delete-button').addEventListener('click', function() {
            if (topicFormToSubmit !== null) {
                document.getElementById(topicFormToSubmit).submit();
            }
        });
    </script>
</main>
</body>
</html>