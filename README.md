<img width="100%" src="https://capsule-render.vercel.app/api?type=waving&color=0d1528&height=120&section=header"/>

<div align="center">

<img src="https://img.shields.io/badge/%CE%9A%20%CE%91%20%CE%99%20%CE%A1%20%CE%9F%20%CE%A3-%E2%80%94-e8a020?style=for-the-badge&labelColor=080d1a&color=080d1a" />

<br><br>

# ⏳ KAIROS

<img src="https://img.shields.io/badge/Masteriza%C3%A7%C3%A3o%20de%20Matem%C3%A1tica%20para%20Concursos-%E2%80%94-e8a020?style=for-the-badge&labelColor=0d1528&color=0d1528"/>

<br>

> *"Resolve. Erra. Aprende onde falhou.*
> *Treina o ponto fraco. Aprova com precisão."*

<br>

![Java](https://img.shields.io/badge/Java_21-e8a020?style=flat-square&logo=openjdk&logoColor=0d1528)
![MySQL](https://img.shields.io/badge/MySQL-e8a020?style=flat-square&logo=mysql&logoColor=0d1528)
![Tailwind](https://img.shields.io/badge/Tailwind_CSS-e8a020?style=flat-square&logo=tailwindcss&logoColor=0d1528)
![POO](https://img.shields.io/badge/POO-e8a020?style=flat-square&logo=buffer&logoColor=0d1528)

</div>

---

<div align="center">

## 🏛️ O Problema que Resolvemos

</div>

<br>

<table>
<tr>
<td>

Estudantes de concursos, vestibulares e provas técnicas perdem tempo revisando o que **já dominam** — enquanto os tópicos onde realmente erram ficam invisíveis.

O **KAIROS** muda isso. A plataforma acompanha cada resposta do aluno, identifica automaticamente os tópicos frágeis — para que o estudo seja **preciso, não aleatório**.

Matemática não se domina com volume. Domina-se com **consciência do erro**.

</td>
</tr>
</table>

---

<div align="center">

## 🧩 Os 3 Módulos

*Cada módulo resolve uma etapa da jornada de domínio em matemática.*

<br>

<table>
<tr>

<td align="center" width="220">
<br>
📚
<br><br>
<b>Banco de Questões</b>
<br><br>
<sub>Gerenciado · Curado · Categorizado</sub>
<br><br>
<sub>Questões de múltipla escolha organizadas por tópico, assunto e nível de dificuldade. O aluno filtra e resolve. Admins e moderadores mantêm o banco atualizado e confiável.</sub>
<br><br>
</td>

<td align="center" width="220">
<br>
🕳️
<br><br>
<b>Mapa de Lacunas</b>
<br><br>
<sub>Detecção Automática · Foco Cirúrgico</sub>
<br><br>
<sub>A cada erro, o sistema registra o tópico e atualiza o perfil do aluno. A tela de lacunas exibe os pontos fracos em tempo real, com acesso direto a questões daquele tópico.</sub>
<br><br>
</td>

<td align="center" width="220">
<br>
📊
<br><br>
<b>Desempenho</b>
<br><br>
<sub>Percentual por Tópico · Alertas de Fragilidade</sub>
<br><br>
<sub>Painel com percentual de acertos por tópico e destaque automático para os que estão abaixo do esperado. O aluno enxerga sua evolução com clareza.</sub>
<br><br>
</td>

</tr>
</table>

</div>

---

<div align="center">

## 👥 Perfis de Usuário

*Três níveis de acesso com responsabilidades distintas.*

<br>

| Perfil | Permissões |
|:------:|-----------|
| 🎓 **Estudante** | Resolve questões · Filtra por tópico · Visualiza lacunas e desempenho |
| 🛠️ **Moderador** | Adiciona · Edita · Remove questões do banco |
| 👑 **Admin** | Gerencia usuários · Cadastra moderadores e admins |

</div>

---

<div align="center">

## 🛠️ Stack Tecnológico

<br>

| | Tecnologia | Função |
|:---:|:---|:---|
| ☕ | **Java 21** | Lógica central e regras de negócio |
| 🗄️ | **MySQL** | Persistência de questões, respostas e desempenho |
| 🎨 | **Tailwind CSS** | Estilização utilitária da interface |
| 🏛️ | **POO + Design Patterns** | Strategy, Observer, DAO |

</div>

---

## 📁 Estrutura de Pacotes

```text
KAIROS/
├── initdb/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── kairos/
│       │           ├── controller/
│       │           ├── dao/
│       │           ├── model/
│       │           ├── servlet/
│       │           └── util/
│       └── webapp/
│           ├── assets/
│           │   └── team/
│           ├── icons/
│           └── WEB-INF/
│               ├── views/
│               └── web.xml
├── docker-compose.yml
├── Dockerfile
└── pom.xml
```

---

<div align="center">

## 🚀 Como Rodar

</div>

<br>

### Pré-requisito

Ter o **Docker** instalado na máquina → <https://www.docker.com/get-started>

<br>

### Passo a passo

**1. Clone o repositório**

```bash
git clone https://github.com/geovanni-martins/KAIROS.git
cd kairos
```

**2. Suba a aplicação**

```bash
docker compose up --build
```

> Na primeira execução, o Docker irá baixar as imagens necessárias e compilar o projeto.

**3. Acesse no navegador**

```text
http://localhost:8080/kairos
```

**4. Para acessar perfis de usuários padrões no sistema**

```text
emails para acessar:
admin@kairos.com
mod.mat@kairos.com
diego.alves@email.com

senha: Kairos@2024
```

<br>

<div align="center">

### Comandos úteis

<table>
<tr>
<th>Comando</th>
<th>O que faz</th>
</tr>

<tr>
<td><code>docker compose up --build</code></td>
<td>Sobe o projeto com recompilação</td>
</tr>

<tr>
<td><code>docker compose up</code></td>
<td>Sobe o projeto sem recompilar</td>
</tr>

<tr>
<td><code>Ctrl + C</code></td>
<td>Para os containers</td>
</tr>

<tr>
<td><code>docker compose down</code></td>
<td>Para e remove os containers</td>
</tr>

</table>

</div>

---

<div align="center">

## 👥 Equipe

<br>

<table>
<tr>

<td align="center" width="260">
<br>
<img src="https://img.shields.io/badge/G-Desenvolvedor-e8a020?style=for-the-badge&labelColor=0d1528"/>
<br><br>
<b>Geovanni Martins de Souza</b>
<br><br>
</td>

<td align="center" width="260">
<br>
<img src="https://img.shields.io/badge/D-Desenvolvedor-e8a020?style=for-the-badge&labelColor=0d1528"/>
<br><br>
<b>Davi Monteiro Carvalho</b>
<br><br>
</td>

<td align="center" width="260">
<br>
<img src="https://img.shields.io/badge/L-Desenvolvedor-e8a020?style=for-the-badge&labelColor=0d1528"/>
<br><br>
<b>Leonardo dos Santos Pereira</b>
<br><br>
</td>

</tr>

<tr>
<td colspan="3" align="center">
<br><br>
<img src="https://img.shields.io/badge/W-Orientador-e8a020?style=for-the-badge&labelColor=0d1528"/>
<br><br>
<b>Woquiton Lima Fernandes</b>
<br><br>
</td>
</tr>

</table>

<br>

---

*Κ Α Ι Ρ Ο Σ · Programação Orientada a Objetos · 2025*

<br>

<img width="100%" src="https://capsule-render.vercel.app/api?type=waving&color=0d1528&height=100&section=footer"/>

</div>
