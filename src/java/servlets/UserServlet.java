
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.UserService;


public class UserServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request,response);
        return;
       }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        String uEmail = request.getParameter("email");
        String uFirstName = request.getParameter("firstName");
        String uLastName = request.getParameter("lastName");
        String uPass = request.getParameter("password");
        String uRole = request.getParameter("role");    
        
        boolean isActive = false;
        UserService user = new UserService();
        
        try{
            if (action.equals("new")){
                user.insert(uEmail, isActive, uFirstName, uLastName, uPass, 0);                
            }
            else if (action.equals("edit")){
                user.update(isActive, uFirstName, uLastName, uPass, 0);
            }
            else if (action.equals("delete")){
                user.delete(uEmail);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        return;
    }

}
