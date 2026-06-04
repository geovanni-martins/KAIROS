<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kairos — Sobre o projeto</title>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <style type="text/tailwindcss">
        @theme {
            --color-fundo-geral:     #0B101E;
            --color-fundo-card:      #161F35;
            --color-fundo-hover:     #1D2B48;
            --color-linha-divisoria: #1D2B48;
            --color-marca-kairos:    #E16144;
            --color-marca-escuro:    #C9523A;
            --color-texto-padrao:    #ffffff;
            --color-texto-opaco:     #8494b0;
            --color-status-verde:    #22c55e;
            --font-sora: "Sora", sans-serif;
            --font-mono: "JetBrains Mono", monospace;
        }
    </style>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/icons/favicon.png">
</head>
<body class="min-h-screen bg-fundo-geral text-texto-padrao font-sora">

<%@include file="header.jsp"%>

<%-- HERO --%>
<section class="relative overflow-hidden">
    <div class="absolute inset-0 pointer-events-none">
        <div class="absolute top-0 left-1/2 -translate-x-1/2 w-[700px] h-[400px] bg-marca-kairos/5 rounded-full blur-3xl"></div>
    </div>
    <div class="relative max-w-3xl mx-auto px-4 pt-20 pb-16 text-center">
        <div class="inline-flex items-center justify-center w-16 h-16 rounded-2xl bg-marca-kairos/10 border border-marca-kairos/25 font-mono text-[26px] font-bold text-marca-kairos mb-6">
            &#x3A3;
        </div>
        <h1 class="text-[36px] md:text-[48px] font-bold text-texto-padrao leading-tight mb-4">
            Kairos
        </h1>
        <p class="text-[15px] md:text-[16px] text-texto-opaco max-w-lg mx-auto leading-relaxed mb-8">
            Plataforma educacional de matemática para estudantes brasileiros que se preparam
            para vestibulares e concursos.
        </p>
        <div class="flex flex-col sm:flex-row gap-3 justify-center">
            <a href="${pageContext.request.contextPath}/login"
               class="px-7 py-3 bg-marca-kairos text-white text-[14px] font-bold rounded-xl hover:bg-marca-escuro active:scale-[.98] transition-all">
                Acessar o sistema
            </a>
            <a href="https://github.com/geovanni-martins/KAIROS" target="_blank" rel="noopener noreferrer"
               class="px-7 py-3 bg-fundo-card border border-linha-divisoria text-texto-opaco text-[14px] font-bold rounded-xl hover:border-marca-kairos hover:text-texto-padrao transition-all flex items-center justify-center gap-2">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M12 0C5.37 0 0 5.37 0 12c0 5.3 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61-.546-1.385-1.335-1.755-1.335-1.755-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 21.795 24 17.295 24 12c0-6.63-5.37-12-12-12z"/>
                </svg>
                Ver repositório
            </a>
        </div>
    </div>
</section>

<main class="max-w-3xl mx-auto px-4 pb-16 space-y-12">

    <%-- DIVISOR --%>
    <div class="border-t border-linha-divisoria"></div>

    <%-- O QUE É --%>
    <section>
        <p class="text-[11px] font-semibold tracking-[0.14em] uppercase text-marca-kairos mb-4">O que é</p>
        <div class="bg-fundo-card border border-linha-divisoria rounded-2xl p-6">
            <p class="text-[14px] text-texto-opaco leading-relaxed">
                O Kairos é um sistema web de estudos focado em matemática, desenvolvido para ajudar
                estudantes a identificar e superar suas dificuldades de forma estruturada. O nome faz
                referência ao conceito grego de <em class="text-texto-padrao">momento oportuno</em> — a ideia
                de que o aprendizado acontece no tempo certo, com a prática certa.
            </p>
        </div>
    </section>

    <%-- PROBLEMA QUE RESOLVE --%>
    <section>
        <p class="text-[11px] font-semibold tracking-[0.14em] uppercase text-marca-kairos mb-4">Problema que resolve</p>
        <div class="bg-fundo-card border border-linha-divisoria rounded-2xl p-6">
            <p class="text-[14px] text-texto-opaco leading-relaxed">
                Muitos estudantes não sabem exatamente onde estão errando ou quais tópicos precisam
                de mais atenção. O Kairos registra o desempenho por tópico, sinaliza lacunas de
                conhecimento e apresenta o progresso de forma visual — para que o estudo seja mais
                direcionado e eficiente.
            </p>
        </div>
    </section>

    <%-- FUNCIONALIDADES --%>
    <section>
        <p class="text-[11px] font-semibold tracking-[0.14em] uppercase text-marca-kairos mb-4">Principais funcionalidades</p>
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-3">
            <%
                String[][] funcionalidades = {
                        {"Questões",            "Banco de questões com alternativas, organizadas por tópico matemático."},
                        {"Lacunas",             "Registro automático de tópicos com baixo desempenho para revisão direcionada."},
                        {"Dashboard",           "Visão geral do progresso, acertos, erros e desempenho dos últimos 7 dias."},
                        {"Controle de acesso",  "Perfis de estudante, moderador e administrador com permissões distintas."},
                        {"Gestão de conteúdo",  "Moderadores podem criar, editar e gerenciar questões e tópicos do sistema."},
                        {"Denúncias",           "Estudantes podem reportar erros nas questões para análise dos moderadores."}
                };
                for (String[] f : funcionalidades) {
            %>
            <div class="bg-fundo-card border border-linha-divisoria border-l-[3px] border-l-marca-kairos rounded-xl p-5">
                <p class="text-[13px] font-semibold text-texto-padrao mb-1.5"><%= f[0] %></p>
                <p class="text-[13px] text-texto-opaco leading-relaxed"><%= f[1] %></p>
            </div>
            <% } %>
        </div>
    </section>

    <%-- TECNOLOGIAS --%>
    <section>
        <p class="text-[11px] font-semibold tracking-[0.14em] uppercase text-marca-kairos mb-4">Tecnologias utilizadas</p>
        <div class="bg-fundo-card border border-linha-divisoria rounded-2xl p-6 flex flex-wrap gap-2">
            <%
                String[] techs = {
                        "Java", "Jakarta EE", "Servlets", "JSP", "JDBC",
                        "MySQL", "Tailwind CSS", "Apache Tomcat", "Maven", "MVC"
                };
                for (String tech : techs) {
            %>
            <span class="font-mono text-[12px] font-medium text-marca-kairos bg-marca-kairos/10 border border-marca-kairos/20 rounded-md px-3 py-1">
                <%= tech %>
            </span>
            <% } %>
        </div>
    </section>

        <%-- EQUIPE --%>
        <section>
            <p class="text-[11px] font-semibold tracking-[0.14em] uppercase text-marca-kairos mb-4">
                Equipe de desenvolvimento
            </p>

            <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">

                <%-- ORIENTADOR --%>
                    <div class="group bg-fundo-card border border-marca-kairos/30 rounded-2xl p-6 text-center
            transition-all duration-300 ease-out
            hover:-translate-y-3 hover:scale-[1.02]
            hover:shadow-2xl hover:shadow-marca-kairos/15">
                        <img
                                src="${pageContext.request.contextPath}/assets/team/woquiton.jpeg"
                                alt="Woquiton Lima Fernandes"
                                class="w-20 h-20 mx-auto mb-4 rounded-2xl object-cover border border-marca-kairos/30"
                        >

                        <h3 class="text-sm font-semibold text-texto-padrao">
                            Woquiton Lima Fernandes
                        </h3>

                        <span class="inline-flex mt-2 px-3 py-1 rounded-lg text-[11px] font-medium bg-marca-kairos/10 text-marca-kairos border border-marca-kairos/20">
                            Orientador
                        </span>

                        <a href="https://github.com/woquiton"
                           target="_blank"
                           rel="noopener noreferrer"
                           class="mt-4 inline-flex items-center gap-2 text-[12px] text-marca-kairos hover:text-white transition-colors">
                            <!-- SVG GitHub -->
                            <svg class="w-4 h-4" viewBox="0 0 24 24" fill="currentColor"><path d="M12 0C5.37 0 0 5.37 0 12c0 5.3 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61-.546-1.385-1.335-1.755-1.335-1.755-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 21.795 24 17.295 24 12c0-6.63-5.37-12-12-12z"/></svg>
                            @woquiton
                        </a>

                        <p class="mt-3 text-[12px] text-texto-opaco">
                            IF Baiano • Campus Guanambi
                        </p>
                    </div>

                    <div class="group bg-fundo-card border border-marca-kairos/30 rounded-2xl p-6 text-center
            transition-all duration-300 ease-out
            hover:-translate-y-3 hover:scale-[1.02]
            hover:shadow-2xl hover:shadow-marca-kairos/15">
                        <img
                                src="${pageContext.request.contextPath}/assets/team/moniky.jpg"
                                alt="Sarah Moniky Silva Ribeiro"
                                class="w-20 h-20 mx-auto mb-4 rounded-2xl object-cover border border-marca-kairos/30"
                        >

                        <h3 class="text-sm font-semibold text-texto-padrao">
                            Sarah Moniky Silva Ribeiro
                        </h3>

                        <span class="inline-flex mt-2 px-3 py-1 rounded-lg text-[11px] font-medium bg-marca-kairos/10 text-marca-kairos border border-marca-kairos/20">
                            Orientadora
                        </span>

                        <p class="mt-3 text-[12px] text-texto-opaco">
                            IF Baiano • Campus Guanambi
                        </p>
                    </div>

                <%-- GEOVANNI --%>
                <div class="group bg-fundo-card border border-marca-kairos/30 rounded-2xl p-6 text-center
            transition-all duration-300 ease-out
            hover:-translate-y-3 hover:scale-[1.02]
            hover:shadow-2xl hover:shadow-marca-kairos/15">
                    <img
                            src="${pageContext.request.contextPath}/assets/team/geovanni.jpeg"
                            alt="Geovanni Martins de Souza"
                            class="w-20 h-20 mx-auto mb-4 rounded-2xl object-cover border border-linha-divisoria"
                    >

                    <h3 class="text-sm font-semibold text-texto-padrao">
                        Geovanni Martins de Souza
                    </h3>

                    <span class="inline-flex mt-2 px-3 py-1 rounded-lg text-[11px] font-medium bg-fundo-hover border border-linha-divisoria text-texto-opaco">
                Tech Lead • Desenvolvedor Full Stack • Analista
            </span>

                    <a href="https://github.com/geovanni-martins"
                       target="_blank"
                       rel="noopener noreferrer"
                       class="mt-4 inline-flex items-center gap-2 text-[12px] text-marca-kairos hover:text-white transition-colors">
                        <!-- SVG GitHub -->
                        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="currentColor"><path d="M12 0C5.37 0 0 5.37 0 12c0 5.3 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61-.546-1.385-1.335-1.755-1.335-1.755-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 21.795 24 17.295 24 12c0-6.63-5.37-12-12-12z"/></svg>
                        @geovanni-martins
                    </a>
                </div>

                <%-- DAVI --%>
                <div class="group bg-fundo-card border border-marca-kairos/30 rounded-2xl p-6 text-center
            transition-all duration-300 ease-out
            hover:-translate-y-3 hover:scale-[1.02]
            hover:shadow-2xl hover:shadow-marca-kairos/15">
                    <img
                            src="${pageContext.request.contextPath}/assets/team/davi.jpeg"
                            alt="Davi Monteiro Carvalho"
                            class="w-20 h-20 mx-auto mb-4 rounded-2xl object-cover border border-linha-divisoria"
                    >

                    <h3 class="text-sm font-semibold text-texto-padrao">
                        Davi Monteiro Carvalho
                    </h3>

                    <span class="inline-flex mt-2 px-3 py-1 rounded-lg text-[11px] font-medium bg-fundo-hover border border-linha-divisoria text-texto-opaco">
                Desenvolvedor Full Stack • Analista
                </span>
                    <a href="https://github.com/davicarvalh0"
                       target="_blank"
                       rel="noopener noreferrer"
                       class="mt-4 inline-flex items-center gap-2 text-[12px] text-marca-kairos hover:text-white transition-colors">
                        <!-- SVG GitHub -->
                        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="currentColor"><path d="M12 0C5.37 0 0 5.37 0 12c0 5.3 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61-.546-1.385-1.335-1.755-1.335-1.755-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 21.795 24 17.295 24 12c0-6.63-5.37-12-12-12z"/></svg>
                        @davicarvalh0
                    </a>
                </div>

                <%-- LEONARDO --%>
                <div class="group bg-fundo-card border border-marca-kairos/30 rounded-2xl p-6 text-center
            transition-all duration-300 ease-out
            hover:-translate-y-3 hover:scale-[1.02]
            hover:shadow-2xl hover:shadow-marca-kairos/15">
                    <img
                            src="${pageContext.request.contextPath}/assets/team/leonardo.jpeg"
                            alt="Leonardo dos Santos Pereira"
                            class="w-20 h-20 mx-auto mb-4 rounded-2xl object-cover border border-linha-divisoria"
                    >

                    <h3 class="text-sm font-semibold text-texto-padrao">
                        Leonardo dos Santos Pereira
                    </h3>

                    <span class="inline-flex mt-2 px-3 py-1 rounded-lg text-[11px] font-medium bg-fundo-hover border border-linha-divisoria text-texto-opaco">
                Desenvolvedor Full Stack • Analista
            </span>

                    <a href="https://github.com/LeonardoSantos00"
                       target="_blank"
                       rel="noopener noreferrer"
                       class="mt-4 inline-flex items-center gap-2 text-[12px] text-marca-kairos hover:text-white transition-colors">
                        <!-- SVG GitHub -->
                        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="currentColor"><path d="M12 0C5.37 0 0 5.37 0 12c0 5.3 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61-.546-1.385-1.335-1.755-1.335-1.755-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 21.795 24 17.295 24 12c0-6.63-5.37-12-12-12z"/></svg>
                        @LeonardoSantos00
                    </a>
                </div>

                <%-- HIAGO --%>
                <div class="group bg-fundo-card border border-marca-kairos/30 rounded-2xl p-6 text-center
            transition-all duration-300 ease-out
            hover:-translate-y-3 hover:scale-[1.02]
            hover:shadow-2xl hover:shadow-marca-kairos/15">
                    <img
                            src="${pageContext.request.contextPath}/assets/team/hiago.jpeg"
                            alt="Hiago Rocha Souza"
                            class="w-20 h-20 mx-auto mb-4 rounded-2xl object-cover border border-linha-divisoria"
                    >

                    <h3 class="text-sm font-semibold text-texto-padrao">
                        Hiago Rocha Souza
                    </h3>

                    <div class="mt-2">
                        <span class="inline-flex px-3 py-1 rounded-lg text-[11px] font-medium bg-fundo-hover border border-linha-divisoria text-texto-opaco">
                            Analista
                        </span>
                    </div>

                    <a href="https://github.com/HiagoLBP"
                       target="_blank"
                       rel="noopener noreferrer"
                       class="mt-4 inline-flex items-center gap-2 text-[12px] text-marca-kairos hover:text-white transition-colors">
                        <!-- SVG GitHub -->
                        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="currentColor"><path d="M12 0C5.37 0 0 5.37 0 12c0 5.3 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61-.546-1.385-1.335-1.755-1.335-1.755-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 21.795 24 17.295 24 12c0-6.63-5.37-12-12-12z"/></svg>
                        @HiagoLBP
                    </a>
                </div>

                <%-- FELIPE --%>
                <div class="group bg-fundo-card border border-marca-kairos/30 rounded-2xl p-6 text-center xl:col-start-2 xl:justify-self-center
            transition-all duration-300 ease-out
            hover:-translate-y-3 hover:scale-[1.02]
            hover:shadow-2xl hover:shadow-marca-kairos/15">
                    <img
                            src="${pageContext.request.contextPath}/assets/team/felipe.jpeg"
                            alt="Felipe Andrade dos Santos Carvalho"
                            class="w-20 h-20 mx-auto mb-4 rounded-2xl object-cover border border-linha-divisoria"
                    >

                    <h3 class="text-sm font-semibold text-texto-padrao">
                        Felipe Andrade dos Santos Carvalho
                    </h3>

                    <div class="mt-2">
                        <span class="inline-flex px-3 py-1 rounded-lg text-[11px] font-medium bg-fundo-hover border border-linha-divisoria text-texto-opaco">
                            Analista
                        </span>
                    </div>

                    <a href="https://github.com/felipeand7"
                       target="_blank"
                       rel="noopener noreferrer"
                       class="mt-4 inline-flex items-center gap-2 text-[12px] text-marca-kairos hover:text-white transition-colors">
                        <!-- SVG GitHub -->
                        <svg class="w-4 h-4" viewBox="0 0 24 24" fill="currentColor"><path d="M12 0C5.37 0 0 5.37 0 12c0 5.3 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61-.546-1.385-1.335-1.755-1.335-1.755-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 21.795 24 17.295 24 12c0-6.63-5.37-12-12-12z"/></svg>
                        @felipeand7
                    </a>
                </div>

            </div>
        </section>
    <%-- INFORMAÇÃO ACADÊMICA --%>
    <section>
        <p class="text-[11px] font-semibold tracking-[0.14em] uppercase text-marca-kairos mb-4">Informação acadêmica</p>
        <div class="bg-fundo-card border border-linha-divisoria rounded-2xl p-6 space-y-3">
            <p class="text-[14px] text-texto-opaco leading-relaxed">
                Este sistema foi desenvolvido como atividade prática da disciplina de
                <strong class="text-texto-padrao">Linguagem de Programação Orientada a Objetos — LPOO</strong>,
                no curso de <strong class="text-texto-padrao">Análise e Desenvolvimento de Sistemas</strong>,
                sob orientação do professor <strong class="text-texto-padrao">Woquiton Fernandes</strong>.
            </p>
            <p class="text-[14px] text-texto-opaco leading-relaxed">
                O objetivo do projeto é aplicar conceitos de programação orientada a objetos,
                organização em camadas, banco de dados e desenvolvimento de sistemas web, a partir
                de uma proposta criada pela equipe.
            </p>
        </div>
    </section>

    <%-- RODAPÉ --%>
    <div class="text-center pt-6 border-t border-linha-divisoria">
        <p class="text-[12px] text-texto-opaco/50 leading-relaxed mb-6">
            Projeto acadêmico desenvolvido para fins de aprendizagem, integração de
            conhecimentos e prática de desenvolvimento de software.
        </p>
        <a href="${pageContext.request.contextPath}/login"
           class="inline-flex items-center gap-2 text-[13px] font-bold text-white bg-marca-kairos rounded-xl px-7 py-3 hover:bg-marca-escuro active:scale-[.98] transition-all">
            Acessar o sistema
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7l5 5m0 0l-5 5m5-5H6"></path></svg>
        </a>
    </div>

</main>
</body>
</html>