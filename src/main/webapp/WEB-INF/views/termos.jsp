<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Termos de Uso e Política de Privacidade - Kairos </title>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <style type="text/tailwindcss">
        @theme {
            --color-fundo-geral: #0B101E;
            --color-fundo-card: #161F35;
            --color-marca-kairos: #E16144;
            --color-texto-padrao: #ffffff;
            --color-texto-opaco: #8494b0;
            --font-sora: "Sora", sans-serif;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/icons/favicon.png">
</head>
<body class="bg-fundo-geral text-texto-padrao font-sora min-h-screen p-6 md:p-12 flex justify-center">

    <main class="bg-fundo-card max-w-4xl w-full p-8 md:p-12 rounded-2xl shadow-2xl border border-[#1D2B48]">
        <h1 class="text-3xl font-bold mb-8 text-white border-b border-[#1D2B48] pb-4">Termos de Uso e Política de Privacidade</h1>
        
        <div class="space-y-8 text-texto-opaco leading-relaxed text-sm md:text-base">
            
            <section>
                <h2 class="text-xl font-semibold text-marca-kairos mb-3">1. Aceitação dos Termos</h2>
                <p>Ao acessar e utilizar o sistema KAIROS, você concorda em cumprir estes Termos de Uso. O KAIROS é uma plataforma educacional desenvolvida para análise de desempenho e identificação de lacunas de aprendizado através de resoluções de questões.</p>
            </section>

            <section>
                <h2 class="text-xl font-semibold text-marca-kairos mb-3">2. Uso da Plataforma</h2>
                <p>O usuário compromete-se a utilizar a plataforma de maneira ética e responsável, fornecendo informações verdadeiras no cadastro. O KAIROS monitora o percentual de acertos e erros exclusivamente para gerar métricas de nivelamento e sugerir revisões focadas.</p>
            </section>

            <section>
                <h2 class="text-xl font-semibold text-marca-kairos mb-3">3. Privacidade e Proteção de Dados (LGPD)</h2>
                <p>Levamos sua privacidade a sério. Coletamos apenas os dados essenciais para o funcionamento do sistema (Nome, E-mail e histórico de respostas). O KAIROS garante que:</p>
                <ul class="list-disc list-inside mt-3 space-y-2 ml-4">
                    <li>Suas senhas são armazenadas de forma segura e não são expostas.</li>
                    <li>Seu histórico de desempenho não é compartilhado com terceiros ou outras plataformas.</li>
                    <li>As métricas geradas são de uso exclusivo para o seu aprimoramento na plataforma.</li>
                </ul>
            </section>

            <section>
                <h2 class="text-xl font-semibold text-marca-kairos mb-3">4. Modificações no Serviço</h2>
                <p>A equipe do KAIROS reserva-se o direito de atualizar, modificar ou descontinuar funcionalidades do sistema a qualquer momento, visando sempre a melhoria da experiência de aprendizado.</p>
            </section>

        </div>

        <div class="mt-12 pt-6 border-t border-[#1D2B48] text-center">
            <a href="${pageContext.request.contextPath}/register" class="inline-block bg-marca-kairos hover:bg-[#C9523A] text-white font-semibold py-3 px-8 rounded-xl transition-colors">
                Voltar para o Cadastro
            </a>
        </div>
    </main>

</body>
</html>