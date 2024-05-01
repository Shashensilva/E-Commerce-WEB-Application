<%@page import="DataModel.ProductData"%>
<%@page import="servelets.database"%>
<%@include file="base.jsp" %>

<% 

 database db = new database();
 
  List<ProductData> products = db.get_all_product();



%>

    <section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <ul class="filter__controls">
                    <li class="active" data-filter="*">Best Sellers</li>
                </ul>
            </div>
        </div>
        <div class="row product__filter">
            <% for (ProductData product : products ) { %>
                <div class="col-lg-3 col-md-6 col-sm-6 mix hot-sales">
                    <div class="product__item">
                        <a href="ProductView?PID=<%= product.getPID() %>">      
                            <div class="product__item__pic set-bg" data-setbg="<%= product.getP_image() %>">
                                <img src="<%= product.getP_image() %>" alt="<%= product.getP_Name() %>">
                            </div>
                        </a>
                            
                   
                            <br/>
                            <br/>
                            <br/>
                        <div class="product__item__text">
                           
                            <h6><%= product.getP_Name() %></h6>
                            <a href="add-to-cart?id=<%= product.getPID() %>" class="add-cart">+ Add To Cart</a>
                           
                            
                            <h5>$<%= product.getP_Price() %></h5>
                            <div class="product__color__select">
                                <label for="pc-<%= product.getPID() %>">
                                    <input type="radio" id="pc-<%= product.getPID() %>">
                                </label>
                                <!-- Add more color options if applicable -->
                            </div>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
</section>
