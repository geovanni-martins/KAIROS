<%@ page contentType="text/html;charset=UTF-8" %>
<%
Object produtoObj = request.getAttribute("produto");
boolean isEdicao = (produtoObj != null);

    // Evita NullPointerException
    String nome = "";
    String preco = "";
    String estoque = "";
    String id = "";

    if (isEdicao) {
        // ajuste o cast conforme sua classe Produto
        Produto p = (Produto) produtoObj;
        nome = p.getNome();
        preco = String.valueOf(p.getPreco());
        estoque = String.valueOf(p.getEstoque());
        id = String.valueOf(p.getId());
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <title><%= isEdicao ? "Editar Produto" : "Novo Produto" %></title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50 min-h-screen">

<div class="max-w-lg mx-auto py-10 px-4">
  <h1 class="text-2xl font-bold text-gray-800 mb-6">
    <%= isEdicao ? "Editar: " + nome : "Novo Produto" %>
  </h1>

  <div class="bg-white rounded-xl shadow p-6">

    <form action="<%= request.getContextPath() %>/produtos" method="post" id="formProduto" novalidate>

      <% if (isEdicao) { %>
        <input type="hidden" name="id" value="<%= id %>">
      <% } %>

      <div class="mb-4">
        <label class="block text-sm font-medium text-gray-700 mb-1">Nome</label>
        <input type="text" name="nome" value="<%= nome %>" required
               class="w-full border border-gray-300 rounded-lg px-3 py-2
                      focus:outline-none focus:ring-2 focus:ring-blue-500">
        <p class="text-red-500 text-xs mt-1 hidden" data-error="nome">Nome é obrigatório</p>
      </div>

      <div class="mb-4">
        <label class="block text-sm font-medium text-gray-700 mb-1">Preço (R$)</label>
        <input type="number" name="preco" value="<%= preco %>" step="0.01" min="0" required
               class="w-full border border-gray-300 rounded-lg px-3 py-2
                      focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>

      <div class="mb-6">
        <label class="block text-sm font-medium text-gray-700 mb-1">Estoque</label>
        <input type="number" name="estoque" value="<%= estoque %>" min="0" required
               class="w-full border border-gray-300 rounded-lg px-3 py-2
                      focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>

      <div class="flex gap-3">
        <button type="submit"
                class="flex-1 bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700 transition font-medium">
          Salvar
        </button>

        <a href="<%= request.getContextPath() %>/produtos"
           class="flex-1 text-center border border-gray-300 py-2 rounded-lg hover:bg-gray-100 transition">
          Cancelar
        </a>
      </div>

    </form>
  </div>
</div>

<script>
  document.getElementById('formProduto').addEventListener('submit', function(e) {
    const nome = this.querySelector('[name="nome"]');
    const errorNome = document.querySelector('[data-error="nome"]');

    if (!nome.value.trim()) {
      e.preventDefault();
      nome.classList.add('border-red-400');
      errorNome.classList.remove('hidden');
    }
  });
</script>

</body>
</html>