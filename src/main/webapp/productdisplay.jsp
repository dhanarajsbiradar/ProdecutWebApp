<%@ page language="java" import="java.util.List, com.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>All Products</title>
    <link rel="stylesheet" href="css/styles.css" />
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #333;
            padding: 8px 12px;
            text-align: center;
        }
        th {
            background-color: #ddd;
        }
        h2 {
            text-align: center;
        }
        .center {
            text-align: center;
        }
        a, .print-button {
            display: block;
            text-align: center;
            margin: 20px auto;
            text-decoration: none;
            font-weight: bold;
        }
        .print-button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        @media print {
            .print-button, a {
                display: none !important;
            }
        }
    </style>
</head>
<body>
    <h2>Product List</h2>

    <%
        @SuppressWarnings("unchecked")
        List<Product> products = (List<Product>) request.getAttribute("productList");

        if (products == null || products.isEmpty()) {
    %>
        <p class="center">No products found in the database.</p>
    <%
        } else {
    %>
        <table>
            <tr>
                <th>Product ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Quantity</th>
            </tr>
            <%
                for (Product p : products) {
            %>
                <tr>
                    <td><%= p.getProductID() %></td>
                    <td><%= p.getProductName() %></td>
                    <td><%= p.getCategory() %></td>
                    <td><%= p.getPrice() %></td>
                    <td><%= p.getQuantity() %></td>
                </tr>
            <%
                }
            %>
        </table>
    <%
        }
    %>

    <!-- ✅ Print Button Moved Below the Table -->
    <div class="center">
        <button class="print-button" onclick="window.print()">Print Product List</button>
    </div>

    <a href="index.jsp">Back to Home</a>
</body>
</html>
