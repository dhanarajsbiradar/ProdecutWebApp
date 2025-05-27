<%@ page language="java" import="java.util.List, com.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Report Results</title>
    <link rel="stylesheet" href="css/styles.css" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 0;
            padding: 30px 20px;
        }

        h2 {
            text-align: center;
            color: #444;
            font-weight: 700;
            letter-spacing: 1px;
            margin-bottom: 30px;
        }

        p {
            text-align: center;
            font-size: 1.1em;
            color: #666;
            margin-top: 40px;
        }

        table {
            width: 90%;
            max-width: 900px;
            margin: 0 auto 40px auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 18px;
            text-align: center;
            border-bottom: 1px solid #eee;
            font-size: 1em;
        }

        th {
            background-color: #007BFF;
            color: white;
            font-weight: 600;
            letter-spacing: 0.05em;
            text-transform: uppercase;
        }

        tr:hover {
            background-color: #f1faff;
        }

        a {
            display: inline-block;
            margin: 10px 15px;
            text-decoration: none;
            color: #007BFF;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #0056b3;
        }

        /* Responsive */
        @media (max-width: 600px) {
            table, th, td {
                font-size: 0.9em;
            }
        }
    </style>
</head>
<body>
    <h2>Report Results</h2>

    <%
        Object obj = request.getAttribute("reportProducts");
        List<Product> products = null;

        if (obj instanceof List<?>) {
            boolean valid = true;
            for (Object o : (List<?>) obj) {
                if (!(o instanceof Product)) {
                    valid = false;
                    break;
                }
            }
            if (valid) {
                products = (List<Product>) obj; // safe cast after check
            }
        }

        if (products == null) {
    %>
        <p>No data to display.</p>
    <%
        } else if (products.isEmpty()) {
    %>
        <p>No products found for the selected criteria.</p>
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

    <div style="text-align:center;">
        <a href="report_form.jsp">Back to Report Form</a> |
        <a href="index.jsp">Back to Home</a>
    </div>
</body>
</html>
