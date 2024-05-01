
<%@page import="DataModel.orders"%>
<%@page import="servelets.database"%>
<%@include file="base.jsp" %>

<%

  if (user_email != null) {


     int user_id = ((Integer) session.getAttribute("user_id")).intValue();

                                       
                                 
%>
<head>
 <style>
     
    .table{
  position: relative;
  max-width: 1024px;
  width: 100%;
  background: #fff;
  perspective: 2700px;
   margin-top: 40px;
  margin-left: 10%;
}

   </style>
</head>

  <body>
      <div class="table">
    <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">Order Id</th>
      <th scope="col">Product Name</th>
      <th scope="col">Billing Address</th>
      <th scope="col">Quality</th>
      <th scope="col">Total Price</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
      
      
        <%
                                  

                                       
                                            database db = new database();
                                            List<orders> order_List = db.getOrdersByUserId(user_id);

                                              for (orders order : order_List) {
                                                  
                                                  
                                                  System.out.println(order.getPID());
                                              
                                              %>
      
      
    <tr>
      <th scope="row"></th>
      <td><%= order.getOid() %></td>
      <td><%= order.getPID()%></td>
      <td><%= order.getBilling_Address()%></td>
      <td><%= order.getQuantity()%></td>
      
      <%  double Total = order.getQuantity()*order.getPrice(); %>
      
      
      <td>$<%= Total %></td>
      <th scope="col"></th>
    </tr>
    
    <%
 }
%>
    
  </tbody>
</table>
          
    </div>
  </body>
</html>


<% } else { response.sendRedirect("login.jsp"); } %>