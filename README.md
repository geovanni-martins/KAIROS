<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>KAIROS — README</title>
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700;900&family=Crimson+Pro:ital,wght@0,300;0,400;0,600;1,300;1,400&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
<style>
  :root {
    --midnight: #080d1a;
    --deep: #0d1528;
    --navy: #111e35;
    --panel: #141f38;
    --border: #1e2f50;
    --amber: #e8a020;
    --amber-soft: #f5c055;
    --amber-glow: rgba(232, 160, 32, 0.12);
    --blue-accent: #4a7fc1;
    --blue-soft: #7aa8d8;
    --text: #d4dff0;
    --text-dim: #7a90b0;
    --text-bright: #eef2fa;
    --white: #ffffff;
  }

  * { margin: 0; padding: 0; box-sizing: border-box; }

  body {
    background: var(--midnight);
    color: var(--text);
    font-family: 'Crimson Pro', Georgia, serif;
    font-size: 18px;
    line-height: 1.7;
    overflow-x: hidden;
  }

  /* ── STAR FIELD ── */
  .stars {
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    pointer-events: none;
    z-index: 0;
    overflow: hidden;
  }
  .star {
    position: absolute;
    background: white;
    border-radius: 50%;
    animation: twinkle var(--d) ease-in-out infinite;
    animation-delay: var(--delay);
    opacity: 0;
  }
  @keyframes twinkle {
    0%, 100% { opacity: 0; }
    50% { opacity: var(--op); }
  }

  /* ── HERO ── */
  .hero {
    position: relative;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    padding: 60px 40px;
    z-index: 1;
    overflow: hidden;
  }

  .hero::before {
    content: '';
    position: absolute;
    top: -200px; left: 50%;
    transform: translateX(-50%);
    width: 900px; height: 900px;
    background: radial-gradient(ellipse, rgba(232,160,32,0.06) 0%, transparent 65%);
    pointer-events: none;
    animation: pulse 6s ease-in-out infinite;
  }

  .hero::after {
    content: '';
    position: absolute;
    bottom: 0; left: 0; right: 0;
    height: 2px;
    background: linear-gradient(90deg, transparent, var(--amber), var(--amber-soft), var(--amber), transparent);
    opacity: 0.4;
  }

  @keyframes pulse {
    0%, 100% { opacity: 1; transform: translateX(-50%) scale(1); }
    50% { opacity: 0.6; transform: translateX(-50%) scale(1.08); }
  }

  .hero-badge {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    background: var(--amber-glow);
    border: 1px solid rgba(232,160,32,0.3);
    color: var(--amber-soft);
    font-family: 'JetBrains Mono', monospace;
    font-size: 11px;
    letter-spacing: 0.2em;
    padding: 6px 18px;
    border-radius: 30px;
    margin-bottom: 48px;
    animation: fadeDown 0.8s ease both;
  }

  .hero-badge::before {
    content: '';
    width: 6px; height: 6px;
    background: var(--amber);
    border-radius: 50%;
    animation: blink 2s ease-in-out infinite;
  }

  @keyframes blink {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.2; }
  }

  .kairos-symbol {
    font-family: 'Cinzel', serif;
    font-size: clamp(14px, 3vw, 18px);
    letter-spacing: 0.5em;
    color: var(--amber);
    opacity: 0.6;
    margin-bottom: 16px;
    animation: fadeDown 0.9s 0.1s ease both;
  }

  .hero-title {
    font-family: 'Cinzel', serif;
    font-size: clamp(72px, 14vw, 140px);
    font-weight: 900;
    line-height: 0.95;
    letter-spacing: -0.02em;
    margin-bottom: 24px;
    animation: fadeDown 1s 0.2s ease both;
    background: linear-gradient(135deg, var(--amber-soft) 0%, var(--amber) 40%, #c06010 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    filter: drop-shadow(0 0 40px rgba(232,160,32,0.25));
  }

  .hero-subtitle {
    font-family: 'Cinzel', serif;
    font-size: clamp(13px, 2vw, 16px);
    letter-spacing: 0.35em;
    color: var(--text-dim);
    text-transform: uppercase;
    margin-bottom: 32px;
    animation: fadeDown 1s 0.3s ease both;
  }

  .hero-tagline {
    font-family: 'Crimson Pro', serif;
    font-size: clamp(18px, 2.5vw, 24px);
    font-style: italic;
    font-weight: 300;
    color: var(--text);
    max-width: 640px;
    opacity: 0.85;
    margin-bottom: 56px;
    line-height: 1.5;
    animation: fadeDown 1s 0.4s ease both;
  }

  .hero-tagline span {
    color: var(--amber-soft);
    font-style: normal;
    font-weight: 600;
  }

  .hero-divider {
    width: 120px;
    height: 1px;
    background: linear-gradient(90deg, transparent, var(--amber), transparent);
    margin: 0 auto 56px;
    animation: fadeIn 1.2s 0.5s ease both;
  }

  .badges-row {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
    justify-content: center;
    animation: fadeDown 1s 0.5s ease both;
  }

  .badge {
    display: inline-flex;
    align-items: center;
    gap: 7px;
    background: rgba(255,255,255,0.04);
    border: 1px solid var(--border);
    color: var(--text-dim);
    font-family: 'JetBrains Mono', monospace;
    font-size: 12px;
    padding: 7px 16px;
    border-radius: 6px;
    transition: all 0.2s ease;
  }
  .badge:hover {
    border-color: var(--amber);
    color: var(--amber-soft);
    background: var(--amber-glow);
  }
  .badge-icon { font-size: 14px; }

  @keyframes fadeDown {
    from { opacity: 0; transform: translateY(-20px); }
    to { opacity: 1; transform: translateY(0); }
  }
  @keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
  }

  /* ── SECTIONS ── */
  .container {
    max-width: 900px;
    margin: 0 auto;
    padding: 0 40px;
    position: relative;
    z-index: 1;
  }

  section { padding: 80px 0; }

  section + section {
    border-top: 1px solid var(--border);
  }

  .section-label {
    font-family: 'JetBrains Mono', monospace;
    font-size: 11px;
    letter-spacing: 0.3em;
    color: var(--amber);
    text-transform: uppercase;
    margin-bottom: 12px;
    opacity: 0.8;
  }

  .section-title {
    font-family: 'Cinzel', serif;
    font-size: clamp(28px, 4vw, 40px);
    font-weight: 700;
    color: var(--text-bright);
    line-height: 1.15;
    margin-bottom: 20px;
  }

  .section-desc {
    font-size: 18px;
    color: var(--text-dim);
    max-width: 640px;
    line-height: 1.7;
    margin-bottom: 48px;
  }

  /* ── MYTH BLOCK ── */
  .myth-block {
    background: linear-gradient(135deg, var(--panel), var(--deep));
    border: 1px solid var(--border);
    border-left: 3px solid var(--amber);
    border-radius: 12px;
    padding: 36px 40px;
    position: relative;
    overflow: hidden;
  }

  .myth-block::before {
    content: '⏳';
    position: absolute;
    right: 32px; top: 24px;
    font-size: 72px;
    opacity: 0.06;
    line-height: 1;
  }

  .myth-title {
    font-family: 'Cinzel', serif;
    font-size: 14px;
    letter-spacing: 0.2em;
    color: var(--amber);
    margin-bottom: 16px;
    text-transform: uppercase;
  }

  .myth-text {
    font-size: 18px;
    color: var(--text);
    line-height: 1.8;
  }

  .myth-text em {
    color: var(--amber-soft);
    font-style: italic;
  }

  /* ── PILLARS ── */
  .pillars-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
  }

  @media (max-width: 640px) {
    .pillars-grid { grid-template-columns: 1fr; }
  }

  .pillar-card {
    background: var(--panel);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 28px 28px 28px 24px;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;
    cursor: default;
  }

  .pillar-card::before {
    content: '';
    position: absolute;
    top: 0; left: 0;
    width: 3px; height: 100%;
    background: var(--card-accent, var(--amber));
    border-radius: 3px 0 0 3px;
    transition: width 0.3s ease;
  }

  .pillar-card:hover {
    border-color: rgba(232,160,32,0.3);
    transform: translateY(-3px);
    box-shadow: 0 12px 40px rgba(0,0,0,0.4);
  }

  .pillar-card:hover::before { width: 5px; }

  .pillar-card:nth-child(1) { --card-accent: #e8a020; }
  .pillar-card:nth-child(2) { --card-accent: #4a7fc1; }
  .pillar-card:nth-child(3) { --card-accent: #5eaaa8; }
  .pillar-card:nth-child(4) { --card-accent: #9b72cf; }

  .pillar-emoji {
    font-size: 32px;
    margin-bottom: 16px;
    display: block;
  }

  .pillar-name {
    font-family: 'Cinzel', serif;
    font-size: 16px;
    font-weight: 700;
    color: var(--text-bright);
    margin-bottom: 8px;
  }

  .pillar-science {
    font-family: 'JetBrains Mono', monospace;
    font-size: 10px;
    letter-spacing: 0.1em;
    color: var(--card-accent, var(--amber));
    opacity: 0.8;
    margin-bottom: 12px;
    text-transform: uppercase;
  }

  .pillar-desc {
    font-size: 16px;
    color: var(--text-dim);
    line-height: 1.6;
  }

  /* ── STACK ── */
  .stack-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
    gap: 16px;
  }

  .stack-item {
    display: flex;
    align-items: center;
    gap: 14px;
    background: var(--panel);
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 16px 18px;
    transition: all 0.2s ease;
  }

  .stack-item:hover {
    border-color: rgba(232,160,32,0.3);
    background: var(--deep);
  }

  .stack-icon {
    font-size: 24px;
    flex-shrink: 0;
  }

  .stack-info { flex: 1; }

  .stack-name {
    font-family: 'JetBrains Mono', monospace;
    font-size: 13px;
    font-weight: 500;
    color: var(--text-bright);
  }

  .stack-role {
    font-size: 14px;
    color: var(--text-dim);
    margin-top: 2px;
  }

  /* ── CRUDS ── */
  .cruds-table {
    width: 100%;
    border-collapse: collapse;
    border-radius: 12px;
    overflow: hidden;
    border: 1px solid var(--border);
  }

  .cruds-table th {
    background: var(--navy);
    font-family: 'JetBrains Mono', monospace;
    font-size: 11px;
    letter-spacing: 0.15em;
    color: var(--amber);
    text-transform: uppercase;
    padding: 14px 20px;
    text-align: left;
    border-bottom: 1px solid var(--border);
  }

  .cruds-table td {
    padding: 14px 20px;
    font-size: 15px;
    border-bottom: 1px solid rgba(30,47,80,0.6);
    vertical-align: middle;
  }

  .cruds-table tr:last-child td { border-bottom: none; }

  .cruds-table tr:nth-child(odd) td { background: var(--panel); }
  .cruds-table tr:nth-child(even) td { background: var(--deep); }

  .cruds-table tr:hover td { background: rgba(232,160,32,0.05); }

  .module-tag {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    font-weight: 600;
    color: var(--text-bright);
    white-space: nowrap;
  }

  .entities-list {
    font-family: 'JetBrains Mono', monospace;
    font-size: 13px;
    color: var(--blue-soft);
    line-height: 1.8;
  }

  /* ── TEAM ── */
  .team-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
  }

  @media (max-width: 640px) {
    .team-grid { grid-template-columns: 1fr; }
  }

  .team-card {
    background: var(--panel);
    border: 1px solid var(--border);
    border-radius: 12px;
    padding: 28px 24px;
    text-align: center;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
  }

  .team-card::after {
    content: '';
    position: absolute;
    bottom: 0; left: 0; right: 0;
    height: 2px;
    background: linear-gradient(90deg, transparent, var(--amber), transparent);
    opacity: 0;
    transition: opacity 0.3s ease;
  }

  .team-card:hover {
    border-color: rgba(232,160,32,0.3);
    transform: translateY(-4px);
    box-shadow: 0 16px 48px rgba(0,0,0,0.4);
  }

  .team-card:hover::after { opacity: 1; }

  .team-avatar {
    width: 64px; height: 64px;
    background: linear-gradient(135deg, var(--navy), var(--deep));
    border: 2px solid var(--border);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: 'Cinzel', serif;
    font-size: 22px;
    font-weight: 700;
    color: var(--amber);
    margin: 0 auto 16px;
    transition: border-color 0.3s ease;
  }

  .team-card:hover .team-avatar {
    border-color: var(--amber);
  }

  .team-name {
    font-family: 'Cinzel', serif;
    font-size: 14px;
    font-weight: 600;
    color: var(--text-bright);
    line-height: 1.3;
    margin-bottom: 6px;
  }

  .team-role {
    font-family: 'JetBrains Mono', monospace;
    font-size: 11px;
    letter-spacing: 0.1em;
    color: var(--amber);
    opacity: 0.7;
    text-transform: uppercase;
  }

  /* ── FOOTER ── */
  .footer {
    border-top: 1px solid var(--border);
    padding: 48px 0;
    text-align: center;
    position: relative;
    z-index: 1;
  }

  .footer-logo {
    font-family: 'Cinzel', serif;
    font-size: 28px;
    font-weight: 900;
    background: linear-gradient(135deg, var(--amber-soft), var(--amber));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin-bottom: 12px;
  }

  .footer-text {
    font-size: 15px;
    color: var(--text-dim);
    font-style: italic;
  }

  .footer-quote {
    margin-top: 24px;
    font-family: 'Cinzel', serif;
    font-size: 12px;
    letter-spacing: 0.25em;
    color: var(--border);
    text-transform: uppercase;
  }

  /* ── CODE BLOCK ── */
  .code-block {
    background: #0a0f1e;
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 24px 28px;
    font-family: 'JetBrains Mono', monospace;
    font-size: 13px;
    line-height: 1.9;
    color: var(--blue-soft);
    overflow-x: auto;
  }

  .code-block .comment { color: var(--text-dim); }
  .code-block .path { color: var(--amber-soft); }
  .code-block .arrow { color: var(--amber); opacity: 0.5; }

  /* ── SCROLL REVEAL ── */
  .reveal {
    opacity: 0;
    transform: translateY(30px);
    transition: opacity 0.7s ease, transform 0.7s ease;
  }
  .reveal.visible {
    opacity: 1;
    transform: translateY(0);
  }

  /* ── BACK TO TOP ── */
  .back-top {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    margin-top: 32px;
    color: var(--text-dim);
    font-family: 'JetBrains Mono', monospace;
    font-size: 12px;
    letter-spacing: 0.1em;
    cursor: pointer;
    transition: color 0.2s;
    text-decoration: none;
  }
  .back-top:hover { color: var(--amber); }
</style>
</head>
<body>

<!-- STARS -->
<div class="stars" id="stars"></div>

<!-- HERO -->
<div class="hero">
  <div class="hero-badge">POO · JAVA · DISCIPLINA 2025</div>
  <div class="kairos-symbol">Κ Α Ι Ρ Ο Σ</div>
  <h1 class="hero-title">KAIROS</h1>
  <p class="hero-subtitle">Plataforma de Consciência Cognitiva</p>
  <p class="hero-tagline">
    <span>Sabe</span> o que você não sabe.
    <span>Lembra</span> o que está esquecendo.
    <span>Paga</span> o que deve.
    <span>Evolui</span> com missões.
  </p>
  <div class="hero-divider"></div>
  <div class="badges-row">
    <span class="badge"><span class="badge-icon">☕</span> Java 17+</span>
    <span class="badge"><span class="badge-icon">🖼️</span> JavaFX</span>
    <span class="badge"><span class="badge-icon">🗄️</span> PostgreSQL</span>
    <span class="badge"><span class="badge-icon">🤖</span> Gemini AI</span>
    <span class="badge"><span class="badge-icon">🌐</span> REST API</span>
    <span class="badge"><span class="badge-icon">🏛️</span> POO</span>
  </div>
</div>

<div class="container">

  <!-- MYTH -->
  <section class="reveal">
    <div class="section-label">// origem do nome</div>
    <h2 class="section-title">A Mitologia por Trás</h2>
    <div class="myth-block">
      <div class="myth-title">⏳ Kairos — Deus do Momento Oportuno</div>
      <p class="myth-text">
        Na mitologia grega, <em>Kairos</em> era o deus do <em>momento certo</em> — o instante preciso em que
        a ação se torna possível e o conhecimento se cristaliza. Era representado com cabelo apenas
        na frente da cabeça: se você não o pegasse de frente, ele já tinha passado.
        <br><br>
        Esta plataforma carrega seu nome porque <em>aprender não é sobre quantidade — é sobre timing</em>.
        Revisar na hora errada é esquecer. Revisar no momento certo é reter para sempre.
      </p>
    </div>
  </section>

  <!-- PILLARS -->
  <section class="reveal">
    <div class="section-label">// arquitetura do sistema</div>
    <h2 class="section-title">Os 4 Pilares</h2>
    <p class="section-desc">Cada módulo resolve um problema cognitivo real, fundamentado em ciência.</p>
    <div class="pillars-grid">
      <div class="pillar-card">
        <span class="pillar-emoji">🗺️</span>
        <div class="pillar-name">Mapa de Ignorância</div>
        <div class="pillar-science">Metacognição · Janela de Johari</div>
        <p class="pillar-desc">Revela zonas cegas de conhecimento que o aluno desconhece que possui. Questionários adaptativos classificam cada área em quatro estados cognitivos.</p>
      </div>
      <div class="pillar-card">
        <span class="pillar-emoji">💀</span>
        <div class="pillar-name">Obituário do Conhecimento</div>
        <div class="pillar-science">Curva de Ebbinghaus · 1885</div>
        <p class="pillar-desc">Rastreia o decaimento de memória em tempo real e exibe um cemitério visual de conteúdos esquecidos. Agenda revisões antes que o conhecimento morra.</p>
      </div>
      <div class="pillar-card">
        <span class="pillar-emoji">💸</span>
        <div class="pillar-name">EduDebt</div>
        <div class="pillar-science">Teoria da Aprendizagem Significativa · Ausubel</div>
        <p class="pillar-desc">Mapeia pré-requisitos não aprendidos em um grafo de dependências interativo. Gera planos priorizados de recuperação por impacto.</p>
      </div>
      <div class="pillar-card">
        <span class="pillar-emoji">⚔️</span>
        <div class="pillar-name">NeuroQuest</div>
        <div class="pillar-science">Espaçamento · Interleaving · Bjork</div>
        <p class="pillar-desc">IA cruza os dados dos 3 pilares e gera missões personalizadas usando técnicas cognitivas comprovadas: recuperação ativa, espaçamento e interleaving.</p>
      </div>
    </div>
  </section>

  <!-- STACK -->
  <section class="reveal">
    <div class="section-label">// tecnologias</div>
    <h2 class="section-title">Stack Tecnológico</h2>
    <div class="stack-grid">
      <div class="stack-item">
        <span class="stack-icon">☕</span>
        <div class="stack-info">
          <div class="stack-name">Java 17+</div>
          <div class="stack-role">Lógica e regras de negócio</div>
        </div>
      </div>
      <div class="stack-item">
        <span class="stack-icon">🖼️</span>
        <div class="stack-info">
          <div class="stack-name">JavaFX</div>
          <div class="stack-role">Interface gráfica e visualizações</div>
        </div>
      </div>
      <div class="stack-item">
        <span class="stack-icon">🗄️</span>
        <div class="stack-info">
          <div class="stack-name">PostgreSQL</div>
          <div class="stack-role">Persistência dos CRUDs</div>
        </div>
      </div>
      <div class="stack-item">
        <span class="stack-icon">🤖</span>
        <div class="stack-info">
          <div class="stack-name">Gemini AI</div>
          <div class="stack-role">Geração de missões com IA</div>
        </div>
      </div>
      <div class="stack-item">
        <span class="stack-icon">🌐</span>
        <div class="stack-info">
          <div class="stack-name">Java HttpClient</div>
          <div class="stack-role">Consumo de REST APIs</div>
        </div>
      </div>
      <div class="stack-item">
        <span class="stack-icon">🏛️</span>
        <div class="stack-info">
          <div class="stack-name">POO + Design Patterns</div>
          <div class="stack-role">Strategy, Observer, DAO</div>
        </div>
      </div>
    </div>
  </section>

  <!-- CRUDS -->
  <section class="reveal">
    <div class="section-label">// entidades e persistência</div>
    <h2 class="section-title">CRUDs do Sistema</h2>
    <table class="cruds-table">
      <thead>
        <tr>
          <th>Módulo</th>
          <th>Entidades</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><span class="module-tag">👤 Usuários</span></td>
          <td><span class="entities-list">Aluno · Professor · PerfilCognitivo</span></td>
        </tr>
        <tr>
          <td><span class="module-tag">📚 Conteúdo</span></td>
          <td><span class="entities-list">Materia · Conteudo · Prerequisito · DependenciaConteudo</span></td>
        </tr>
        <tr>
          <td><span class="module-tag">🧪 Avaliação</span></td>
          <td><span class="entities-list">Questao · Resposta · SessaoAvaliativa · LacunaDetectada</span></td>
        </tr>
        <tr>
          <td><span class="module-tag">💀 Memória</span></td>
          <td><span class="entities-list">ConteudoAprendido · CicloDeRevisao · IndiceDeRetencao · MetaDeRetencao</span></td>
        </tr>
        <tr>
          <td><span class="module-tag">💸 Dívidas</span></td>
          <td><span class="entities-list">DividaDeAprendizado · PlanoDeRecuperacao · GrafoDePrerequisitos</span></td>
        </tr>
        <tr>
          <td><span class="module-tag">⚔️ Missões</span></td>
          <td><span class="entities-list">Missao · TipoMissao · TrilhaCognitiva · RelatorioDeDesempenho</span></td>
        </tr>
      </tbody>
    </table>
  </section>

  <!-- STRUCTURE -->
  <section class="reveal">
    <div class="section-label">// organização do projeto</div>
    <h2 class="section-title">Estrutura de Pacotes</h2>
    <div class="code-block">
<span class="comment">// cognosapp — arquitetura em camadas</span>
<span class="path">src/main/java/kairos/</span>
├── <span class="path">model/</span>
│   ├── <span class="path">usuario/</span>     <span class="arrow">→</span>  Aluno, Professor, PerfilCognitivo
│   ├── <span class="path">conteudo/</span>    <span class="arrow">→</span>  Materia, Conteudo, Prerequisito
│   ├── <span class="path">memoria/</span>     <span class="arrow">→</span>  ConteudoAprendido, CicloDeRevisao
│   ├── <span class="path">divida/</span>      <span class="arrow">→</span>  DividaDeAprendizado, PlanoDeRecuperacao
│   └── <span class="path">missao/</span>      <span class="arrow">→</span>  Missao, TrilhaCognitiva, Relatorio
├── <span class="path">service/</span>
│   ├── <span class="path">EbbinghausService.java</span>
│   ├── <span class="path">LacunaDetectorService.java</span>
│   └── <span class="path">MissaoGeneratorService.java</span>
├── <span class="path">api/</span>             <span class="arrow">→</span>  GeminiClient.java
├── <span class="path">repository/</span>      <span class="arrow">→</span>  DAOs · PostgreSQL
└── <span class="path">ui/</span>
    ├── <span class="path">CemiterioVisual.java</span>
    ├── <span class="path">GrafoInterativo.java</span>
    ├── <span class="path">RadarDeConhecimento.java</span>
    └── <span class="path">DashboardPrincipal.java</span>
    </div>
  </section>

  <!-- TEAM -->
  <section class="reveal">
    <div class="section-label">// desenvolvedores</div>
    <h2 class="section-title">Equipe</h2>
    <div class="team-grid">
      <div class="team-card">
        <div class="team-avatar">G</div>
        <div class="team-name">Geovanni Martins<br>de Souza</div>
        <div class="team-role">Desenvolvedor</div>
      </div>
      <div class="team-card">
        <div class="team-avatar">D</div>
        <div class="team-name">Davi Monteiro<br>Carvalho</div>
        <div class="team-role">Desenvolvedor</div>
      </div>
      <div class="team-card">
        <div class="team-avatar">L</div>
        <div class="team-name">Leonardo dos Santos<br>Pereira</div>
        <div class="team-role">Desenvolvedor</div>
      </div>
    </div>
  </section>

</div>

<!-- FOOTER -->
<footer class="footer">
  <div class="footer-logo">KAIROS</div>
  <p class="footer-text">O momento certo para aprender é agora.</p>
  <p class="footer-quote">Κ Α Ι Ρ Ο Σ · Programação Orientada a Objetos · 2025</p>
  <a class="back-top" href="#" onclick="window.scrollTo({top:0,behavior:'smooth'});return false;">
    ↑ voltar ao topo
  </a>
</footer>

<script>
  // Stars
  const starsEl = document.getElementById('stars');
  for (let i = 0; i < 160; i++) {
    const s = document.createElement('div');
    s.className = 'star';
    const size = Math.random() * 2 + 0.5;
    s.style.cssText = `
      width:${size}px; height:${size}px;
      top:${Math.random()*100}%; left:${Math.random()*100}%;
      --d:${3+Math.random()*5}s;
      --delay:${Math.random()*6}s;
      --op:${0.2+Math.random()*0.7};
    `;
    starsEl.appendChild(s);
  }

  // Scroll reveal
  const reveals = document.querySelectorAll('.reveal');
  const observer = new IntersectionObserver((entries) => {
    entries.forEach((e, i) => {
      if (e.isIntersecting) {
        setTimeout(() => e.target.classList.add('visible'), i * 80);
      }
    });
  }, { threshold: 0.1 });
  reveals.forEach(r => observer.observe(r));
</script>
</body>
</html>
