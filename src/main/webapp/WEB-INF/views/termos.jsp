<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Termos de Uso e Política de Privacidade - Kairos </title>
    <%@ include file="styles.jsp" %>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/favicon.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/favicon.ico">
</head>
<body class="bg-background text-content font-sora min-h-screen p-6 md:p-12 flex justify-center">

    <main class="bg-surface max-w-4xl w-full p-8 md:p-12 rounded-2xl shadow-2xl border border-divider">
        <h1 class="text-3xl font-bold mb-8 text-white border-b border-divider pb-4">Termos de Uso e Política de Privacidade</h1>
        
        <div class="space-y-8 text-muted leading-relaxed text-sm md:text-base">
            
            <section>
                <h2 class="text-xl font-semibold text-brand mb-3">1. Aceitação dos Termos</h2>
                <p>Ao acessar e utilizar o sistema KAIROS, você concorda em cumprir estes Termos de Uso. O KAIROS é uma plataforma educacional desenvolvida para análise de desempenho e identificação de gaps de aprendizado através de resoluções de questões.</p>
            </section>

            <section>
                <h2 class="text-xl font-semibold text-brand mb-3">2. Uso da Plataforma</h2>
                <p>O usuário compromete-se a utilizar a plataforma de maneira ética e responsável, fornecendo informações verdadeiras no cadastro. O KAIROS monitora o percentual de acertos e erros exclusivamente para gerar métricas de nivelamento e sugerir revisões focadas.</p>
            </section>

            <section>
                <h2 class="text-xl font-semibold text-brand mb-3">3. Privacidade e Proteção de Dados (LGPD)</h2>
                <p>Levamos sua privacidade a sério. Coletamos apenas os dados essenciais para o funcionamento do sistema (Nome, E-mail e histórico de answers). O KAIROS garante que:</p>
                <ul class="list-disc list-inside mt-3 space-y-2 ml-4">
                    <li>Suas senhas são armazenadas de forma segura e não são expostas.</li>
                    <li>Seu histórico de desempenho não é compartilhado com terceiros ou outras plataformas.</li>
                    <li>As métricas geradas são de uso exclusivo para o seu aprimoramento na plataforma.</li>
                </ul>
            </section>

            <section>
                <h2 class="text-xl font-semibold text-brand mb-3">4. Modificações no Serviço</h2>
                <p>A equipe do KAIROS reserva-se o direito de atualizar, modificar ou descontinuar funcionalidades do sistema a qualquer momento, visando sempre a melhoria da experiência de aprendizado.</p>
            </section>

        </div>

        <div class="mt-12 pt-6 border-t border-divider text-center">
            <a href="${pageContext.request.contextPath}/register" class="inline-block bg-brand hover:bg-brand-dark text-white font-semibold py-3 px-8 rounded-xl transition-colors">
                Voltar para o Cadastro
            </a>
        </div>
    </main>

</body>
</html>