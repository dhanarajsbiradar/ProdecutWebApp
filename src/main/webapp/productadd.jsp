<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head> 
    <meta charset="UTF-8" />
    <title>Add New Product</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #61dafb 0%, #e0f7fa 100%);
            color: #282c34;
            margin: 0;
            padding: 40px 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background: #fff;
            padding: 40px 35px;
            border-radius: 16px;
            box-shadow: 0 20px 40px rgba(97, 218, 251, 0.25);
            width: 100%;
            max-width: 480px;
            box-sizing: border-box;
            text-align: left;
        }

        h2 {
            font-weight: 700;
            font-size: 2.2rem;
            margin-bottom: 25px;
            color: #20232a;
            text-align: center;
        }

        label {
            font-weight: 600;
            margin-top: 20px;
            display: block;
            color: #20232a;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 14px 16px;
            margin-top: 6px;
            border: 2px solid #61dafb;
            border-radius: 12px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
            box-sizing: border-box;
        }

        input[type="text"]:focus,
        input[type="number"]:focus {
            border-color: #21a1f1;
            outline: none;
            box-shadow: 0 0 8px rgba(33, 161, 241, 0.6);
        }

        .buttons {
            margin-top: 30px;
            display: flex;
            gap: 16px;
        }

        input[type="submit"],
        input[type="reset"] {
            flex: 1;
            padding: 14px 0;
            font-weight: 600;
            font-size: 1.1rem;
            border-radius: 12px;
            border: 2px solid #61dafb;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 6px 12px rgba(97, 218, 251, 0.2);
            user-select: none;
            background-color: #fff;
            color: #61dafb;
        }

        input[type="submit"]:hover,
        input[type="submit"]:focus {
            background-color: #61dafb;
            color: #fff;
            box-shadow: 0 10px 20px rgba(97, 218, 251, 0.4);
            transform: translateY(-3px);
            outline: none;
        }

        input[type="reset"]:hover,
        input[type="reset"]:focus {
            background-color: #a0defa;
            color: #20232a;
            box-shadow: 0 10px 20px rgba(160, 222, 250, 0.6);
            outline: none;
        }

        .error {
            color: #ff4d4f;
            font-weight: 700;
            margin-bottom: 15px;
            background: #fff1f0;
            border: 1px solid #ffa39e;
            padding: 10px 15px;
            border-radius: 12px;
            text-align: center;
        }

        @media (max-width: 500px) {
            .container {
                padding: 30px 20px;
            }
            .buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add New Product</h2>

        <%-- Show error message if present --%>
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <div class="error">
                <%= errorMessage %>
            </div>
        <%
            }
        %>

        <form action="AddProductServlet" method="post" onsubmit="return validateForm()">
            <label for="productID">Product ID:</label>
            <input type="number" name="productID" id="productID" min="1" required />

            <label for="productName">Product Name:</label>
            <input type="text" name="productName" id="productName" required />

            <label for="category">Category:</label>
            <input type="text" name="category" id="category" required />

            <label for="price">Price:</label>
            <input type="number" step="0.01" name="price" id="price" min="0.01" required />

            <label for="quantity">Quantity:</label>
            <input type="number" name="quantity" id="quantity" min="0" required />

            <div class="buttons">
                <input type="submit" value="Add Product" />
                <input type="reset" value="Reset" />
            </div>
        </form>
    </div>

    <script>
        function validateForm() {
            const price = parseFloat(document.getElementById('price').value);
            const quantity = parseInt(document.getElementById('quantity').value, 10);

            if (isNaN(price) || price <= 0) {
                alert('Price must be a number greater than zero.');
                return false;
            }
            if (isNaN(quantity) || quantity < 0) {
                alert('Quantity cannot be negative.');
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
