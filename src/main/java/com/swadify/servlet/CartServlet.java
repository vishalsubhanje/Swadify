package com.swadify.servlet;

import java.io.IOException;

import com.swadify.model.Cart;
import com.swadify.model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {


        String action = request.getParameter("action");


        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");


        if(cart == null){
            cart = new Cart();
        }


        System.out.println(
        		"menuId = " + request.getParameter("menuId")
        		);
        // ADD ITEM
        if(action == null){


            int menuId =
                    Integer.parseInt(request.getParameter("menuId"));


            String itemName =
                    request.getParameter("itemName");


            double price =
                    Double.parseDouble(request.getParameter("price"));


            int quantity =
                    Integer.parseInt(request.getParameter("quantity"));



            CartItem item =
                    new CartItem(
                            menuId,
                            itemName,
                            quantity,
                            price
                    );


            cart.addItem(item);



        }


        // REMOVE
        else if(action.equals("remove")){


            int menuId =
                    Integer.parseInt(request.getParameter("menuId"));


            cart.removeItem(menuId);

        }


        // UPDATE
        else if(action.equals("update")){


            int menuId =
                    Integer.parseInt(request.getParameter("menuId"));


            int qty =
                    Integer.parseInt(request.getParameter("quantity"));


            cart.updateQuantity(menuId, qty);

        }



        session.setAttribute("cart", cart);


        response.sendRedirect("cart.jsp");

    }
}