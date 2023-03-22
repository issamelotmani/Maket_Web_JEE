<%@page import="java.util.List"%>
<%@page import="managers.*"%>
<%@page import="model.*"%>

<!DOCTYPE html>
<html>
<head>
  <title>Product List</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
  <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css">
</head>
<body>

<%@include file="header.jsp" %>
  <h1>Product List</h1>
  <table id="product-table" class="table table-striped table-bordered table-hover">
    <thead>
      <tr>
        <th>ID</th>
        <th>Libelle</th>
        <th>Prix</th>
        <th>Categorie</th>
        <th>Edit</th>
        <th>Delete</th>
      </tr>
    </thead>
    <tbody>
      <%
        ProduitManager productDao = new ProduitManager();
      CategorieManager categorieDao = new CategorieManager();
        for (Produit product : productDao.AfficherTout()) {
          	Categorie categorie = product.getCategorie();
      %>
        <tr>
          <td><%= product.getIdproduit() %></td>
          <td><%= product.getNameproduit() %></td>
          <td><%= product.getPrix() %></td>
          <td><%= categorie.getLibelleCat() %></td>
          <td ><button class="btn btn-success edit-product" onclick="editProduct(<%= product.getIdproduit() %>)" data-product-id="<%= product.getIdproduit() %>">Edit</button></td>
          <td ><button class="btn btn-danger delete-product" onclick="deleteProduct(<%= product.getIdproduit() %>)" href="Suprimer.do?id=${p.id}" data-product-id="<%= product.getIdproduit() %>">Delete</button> </td>
        </tr>
      <% } %>
    </tbody>
  </table>
  
  <button class="btn btn-primary" onclick="createProduct()">Add Product</button>
  
  <script type="text/javascript">
  function createProduct() {
	  window.location.href = "create-product.jsp";
	}
  </script>
  
  
  <script>
  $(document).ready(function() {
    $('#product-table').DataTable({
      "language": {
        "url": "https://cdn.datatables.net/plug-ins/1.11.3/i18n/en.json"
      },
    });
  });
</script>

<script>
function deleteProduct(id) {
  if (confirm("Are you sure you want to delete this product?")) {
    $.ajax({
      url: "deleteProduct.jsp?id=" + id,
      method: "POST",
      success: function(response) {
        alert("Product deleted successfully");
        window.location.reload();
      },
      error: function(xhr, status, error) {
        alert("An error occurred while deleting the product");
      }
    });
  }
}
</script>


<script>
function editProduct(id) {
	  window.location.href = "edit-product.jsp?id=" + id;
	}
</script>
</body>
</html>


