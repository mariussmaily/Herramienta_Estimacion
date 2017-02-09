<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <title>Error 405</title>
      <jsp:include page="../fragments/sidebar.jsp" />
            <div id="page-wrapper">
         <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Error 405</h1>
            </div>
            <div class="col-lg-2"></div>
            <div class="col-lg-10">
            	<h3>La p�gina solicitada no �s accesible por este metodo</h3>
            </div>
            <!-- /.col-lg-12 -->
         </div>
         </div>
</head>
<body>
	<jsp:include page="../fragments/footer.jsp" />
</body>
</html>