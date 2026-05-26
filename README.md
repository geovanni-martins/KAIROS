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

O **KAIROS** muda isso. A plataforma acompanha cada resposta do aluno, identifica automaticamente os tópicos frágeis e os coloca na frente do estudante — para que o estudo seja **preciso, não aleatório**.

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
| 🎓 **Estudante** | Resolve questões · Filtra por tópico e dificuldade · Visualiza lacunas e desempenho |
| 🛠️ **Moderador** | Adiciona · Edita · Remove questões do banco |
| 👑 **Admin** | Todas as permissões do moderador · Gerencia moderadores · Gerencia tópicos |

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

```
kairos/
├── src/
│   ├── database/
│   │   ├── data.sql
│   │   └── schema.sql
│   ├── main/
│   │   ├── java/
│   │   │   └── com.kairos/
│   │   │       ├── controller/
│   │   │       ├── dao/
│   │   │       ├── model/
│   │   │       ├── servlet/
|   |   |       └── util/
│   │   └── resources/
│   └── webapp/
│       ├── icons/
│       └── WEB-INF/
│           ├── views/
│           └── web.xml
└── .mvn/
```

</div>

---

## 🚀 Como Rodar

### Pré-requisitos

- **Java 21** ou superior
- **Maven 3.9+**
- **Docker** e **Docker Compose**
- Porta **8080** livre para a aplicação
- Porta **3307** livre para o MySQL local

### Configuração do Banco

O projeto usa MySQL com as seguintes credenciais de desenvolvimento:

| Campo | Valor |
|:---|:---|
| Host | `localhost` |
| Porta | `3307` |
| Banco | `kairosdb` |
| Usuário | `root` |
| Senha | `0000` |

Os scripts de criação e carga inicial ficam em:

- `src/database/schema.sql`
- `src/database/data.sql`

### Rodando Localmente

Suba apenas o banco de dados:

```bash
docker compose up -d db
```

Compile o projeto:

```bash
mvn clean package
```

Inicie a aplicação com Tomcat embedded pelo Maven:

```bash
mvn cargo:run
```

Acesse no navegador:

```text
http://localhost:8080/kairos
```

A primeira tela configurada no `web.xml` é o cadastro (`/register`).

### Parando os Serviços

Para parar o banco:

```bash
docker compose down
```

Para reiniciar o banco do zero com os scripts SQL, remova o container e suba novamente:

```bash
docker compose down
docker compose up -d db
```

### Rodando Tudo com Docker

O `docker-compose.yml` também possui um serviço `web`, que constrói a aplicação e expõe a porta `8080`:

```bash
docker compose up --build
```

Para esse modo funcionar, a aplicação precisa conectar no host do banco dentro da rede Docker (`kairos-db:3306`). Se a classe `DBConnection` estiver configurada com `localhost:3307`, use o modo local acima ou ajuste a conexão para ler `DB_HOST` e `DB_PORT` do ambiente.

### Comandos Úteis

```bash
# Gerar o WAR em target/kairos.war
mvn clean package

# Rodar sem executar testes
mvn clean package -DskipTests

# Ver logs do banco
docker compose logs -f db

# Ver logs da aplicação em Docker
docker compose logs -f web
```

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
</table>

<br>

---

*Κ Α Ι Ρ Ο Σ · Programação Orientada a Objetos · 2025*

<br>

<img width="100%" src="https://capsule-render.vercel.app/api?type=waving&color=0d1528&height=100&section=footer"/>

</div>
