import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/RemoveItem"})
public class RemoveItem extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productID = request.getParameter("productID");
        String cartID = request.getParameter("cartID");
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skinbliss", "root", "root");
            java.sql.Statement stmt = con.createStatement();
            String sql = "DELETE FROM cart_product WHERE cart_id = \'" + cartID + "\' AND product_id = \'" + productID + "\';";
            stmt.executeUpdate(sql);
            
            stmt.close();
            
            response.sendRedirect("cart.jsp");
            
        }catch(Exception ex){
            
        } 
    }
}
