<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%         
        int count = 0;
        String shoppingCartID = null;
        
        Class.forName("com.mysql.jdbc.Driver");
        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skinbliss", "root", "root");
        java.sql.Statement stmt = con.createStatement();

        String sql1 = "SELECT id FROM cart WHERE status = \'incomplete\'; ";
        ResultSet rs1 = stmt.executeQuery(sql1);
        if (rs1.next()){
            shoppingCartID = rs1.getString("id");
        }
        
        if (shoppingCartID != null){
            String sql2 = "SELECT COUNT(*) AS total FROM cart_product WHERE cart_id = \'" + shoppingCartID + "\'";
            ResultSet rs2 = stmt.executeQuery(sql2);
            while (rs2.next()){
                count = rs2.getInt("total");
            }
        }
        
        stmt.close();

    %>
    
    <style>
        .cart {
            text-align: center;
            position: relative;
            padding: 10px 10px 20px 0;
            margin-right: 20px;
            margin-top: 10px;
        }
        
        .notif {
            position: absolute;
            background: #ff6600;
            height: 20px;
            top: 0;
            right: 0;
            width: 20px;
            text-align: center;
            line-height: 20px;
            font-size: 12px;
            border-radius: 50%;
            color: white;
            border: 1px solid #ff6600;
            font-family: sans-serif;
            font-weight: bold;
        }
        
    </style>
    
<div class="topnav">
    <a href="index.html"><img src="images/logo.png" alt="logo" height="100"></a>
    <a href="index.html" class="link"> Home</a>
    <div class="dropdownLink link">
        <button class="dropbtn">Products
          <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
          <a href="product.jsp?category=c0002">FACEMASK</a>
          <a href="product.jsp?category=c0003">TONER</a>
          <a href="product.jsp?category=c0004">DAILY CLEANSER</a>
          <a href="product.jsp?category=c0001">SERUM</a>
        </div>
    </div> 
    <a href="about.html" class="link">About Us</a>
    <a href="contact.html" class="link">Contact Us</a>
    <a href="cart.jsp"><div class="fa fa-shopping-cart cartIcon"><div class="notif"><%= count %></div></div></a>
</div>