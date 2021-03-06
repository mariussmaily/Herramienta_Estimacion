<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <title>EF - Criterios</title>
      <jsp:include page="../fragments/sidebar.jsp" />
      
      <div id="page-wrapper">
         <div class="row">
            <div class="col-lg-12">
               <h1 class="page-header">Criterios</h1>
            </div>
            <!-- /.col-lg-12 -->
         </div>

         <!-- /.row -->
         <div class="row">
            <div class="col-lg-12">
               <div class="panel panel-default">
                  <div class="panel-heading">
                     M�dulos 
                  </div>
                  <!-- /.panel-heading -->
                  <div class="panel-body">
                     <table width="100%" class="table table-responsive table-striped table-bordered table-hover tableForm" id="dataTables-example">
                        <thead>
                           <tr>
                               <th class="col-xs-2">Nombre</th>
                              <th class="col-xs-2">C�digo</th>
                              <th class="col-xs-2">Caso de uso</th>
                              <th class="col-xs-1">Total</th>
                              <th class="col-xs-2">Valoraci�n</th>
                           </tr>
                        </thead>
					    <tbody>
                           <c:forEach var="module" items="${modules}">
                          			<c:choose>
                            		<c:when test="${module.code eq display}"> 
	                           			<tr class="odd active">
	                           			<spring:url value="/criterios/saveRow" var="saveUrl"/>
	                           			<form name="SaveRow" action="${saveUrl}" id="save" method="POST">
	                               			<td><input type="text" name="moduleName" class="altura form-control" value="${module.name}" maxlength="25"></td>
	                               			<td><input type="text" name="moduleCode" class="altura form-control" value="${module.code}" maxlength="10"></td>
	                               			<td><input type="text" name="moduleCaseOfUse" class="altura form-control" value="${module.caseOfUse}" maxlength="30"></td>
	                               			<td>${module.total}</td>
	                               			<c:choose>
                            		        	<c:when test="${module.total < 7.5}"> 
		                               				<td class="center info">
		                                   				Muy F�cil
	                                	   		</c:when>
	                                	   		<c:when test="${module.total < 12.5}"> 
		                               				<td class="center success">
		                                   				F�cil
	                                	   		</c:when>
	                                	   		<c:when test="${module.total < 17.5}"> 
		                               				<td class="center warning">
		                                   				Normal
	                                	   		</c:when>
	                                	   		<c:when test="${module.total < 22.5}"> 
		                               				<td class="center danger">
		                                   				Complicado
	                                	   		</c:when>
	                                	   		<c:when test="${module.total > 22.5}"> 
		                               				<td class="center danger2">
		                                   				Muy Complicado
	                                	   		</c:when>
	                                	   	</c:choose>
	                                 	  			<div style="float:right">
	                             	      			<div style="float:left">
	                             	      				<button type="submit" class="button ok glyphicon glyphicon-ok"></button>
	                     	             			</div>
	                   		               			</form>
	                   		               			<spring:url value="/criterios/discard" var="discardUrl" />
	                    	           				<div style="float:right">
	                     	   	           				<form name="deleteRow" action="${discardUrl}" method="POST">
	                           	        				<button type="submit" class="button delete glyphicon glyphicon-remove"></button>
														</form>
	                                  				</div>
	                                  				</div>
	                                  			
	                              			</td>
	                           			</tr>
                            		</c:when>
                            		<c:when test="${module.code ne display}">
                            			 <tr class="odd" onclick="func_test('${module.code}')">
			                           		<td>${module.name}</td>
				                            <td>${module.code}</td>
				                            <td>${module.caseOfUse}</td>
				                            <td>${module.total}</td>
				                            <c:choose>
                            		        	<c:when test="${module.total < 7.5}"> 
		                               				<td class="center info">
		                                   				Muy F�cil
	                                	   		</c:when>
	                                	   		<c:when test="${module.total < 12.5}"> 
		                               				<td class="center success">
		                                   				F�cil
	                                	   		</c:when>
	                                	   		<c:when test="${module.total < 17.5}"> 
		                               				<td class="center warning">
		                                   				Normal
	                                	   		</c:when>
	                                	   		<c:when test="${module.total < 22.5}"> 
		                               				<td class="center danger">
		                                   				Complicado
	                                	   		</c:when>
	                                	   		<c:when test="${module.total > 22.5}"> 
		                               				<td class="center danger2">
		                                   				Muy Complicado
	                                	   		</c:when>
	                                	   	</c:choose>
	                                	   	<c:choose>
	                                	   
	                                	   	<c:when test="${empty display}">
			                                	
			                                  	<spring:url value="/criterios/${module.code}/edit" var="editUrl" />
			                                   	<spring:url value="/criterios/${module.code}/delete" var="deleteUrl" />
			                                   	
			                                   	<div style="float:right">
			                                   		<form name="deleteRow" action="${deleteUrl}" method="POST"><button type="submit" class="button delete glyphicon glyphicon-trash"/></form>
			                                   	</div>
			                                   	<div style="float:right">
			                                   		<form name="editRow" action="${editUrl}" method="POST"><button type="submit" class="button edit glyphicon glyphicon-pencil"/></form>
			                                  	</div>
			                                  	
			                                </c:when>
			                                	</c:choose>
			                               </td>
			                           	</tr>
                            		</c:when>
                          			</c:choose>
                           </c:forEach>
                        </tbody>
                     </table>
                     <!-- /.table-responsive -->
                     
                     <!-- Notification -->
                     <c:if test="${not empty notification}">
                     	<div class="alert alert-${altype} alert-dismissable">
                     		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                     		${notification}
                     	</div>
                     </c:if>
                     
 					</div>
                    <!-- Button -->
                    <div class="panel-footer table-footer-fix clearfix">	
                    	<span style="float:left">
                        <form name="row" action="/proyecto-definitivo/criterios/addRow" method="POST">
                           <button type="submit" class="custom-color left-button corner-button">
                           <i class="glyphicon glyphicon-plus"></i> Crear M�dulo
                           </button>
                        </form>
                   	</span> 
					
                     <span style="float:right">
                        <form name="row" action="/proyecto-definitivo/criterios/saveProject" method="POST">
                           <button type="submit" class="custom-color right-button corner-button">
                           <i class="glyphicon glyphicon-floppy-save"></i> Guardar Proyecto
                           </button>
                        </form>
                     </span> 
                  </div>
                  <!-- /.panel-body -->
               </div>
               <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
         </div>
         <!-- /.row -->
         <hr>

         <jsp:include page="./atributos.jsp" />
         
      </div>
      <!-- /#page-wrapper -->

      </div>
      <!-- /#wrapper -->
	    <!-- jQuery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script>
			$(document).ready(function(){
			    $('[data-toggle="popover"]').popover();   
			});
		</script>
      <jsp:include page="../fragments/footer.jsp" />
      </body>
</html>