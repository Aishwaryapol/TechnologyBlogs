<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<div class="row">
<%

    PostDao d = new PostDao(ConnectionProvider.getConnection()); 
	int cid=Integer.parseInt(request.getParameter("cid")); 
	List<Post> post=null; 
	if(cid!=0){ 
		post=d.getPostBycatId(cid); 
		
		}
	else{ 
		post = d.getAllPost();
	} 
	
	for(Post p:post) {
    	%>
    	
    	<div class="col-md-6 mt-2">
    	<img class="card-img-top" src="blog_pics/<%=p.getpPic() %>" alt="Card image cap">
    	<div class="card">
    	<div class="card-body">
    	  <b> <%=p.getpTitle() %></b>
    	  <p>  <%=p.getpContent()%></p>
    	  <pre>  <%=p.getpCode()%></pre>
    	  
    	</div>
    	</div>
    	
    	</div>
    	
    	<%
    }

%>
</div>