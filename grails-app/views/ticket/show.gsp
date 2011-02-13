
<%@ page import="backboard.Ticket" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>

        <script type="text/javascript" src="/backboard/js/jquery.js"></script>
<script type="text/javascript">
$(function(){
    $("#edit").click(function(){
        $("#detail").load(this.href);
        return false;
    });
});
</script>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ticket.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ticketInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ticket.title.label" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ticketInstance, field: "title")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ticket.content.label" default="Content" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ticketInstance, field: "content")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ticket.owner.label" default="Owner" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ticketInstance, field: "owner")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ticket.type.label" default="Type" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ticketInstance, field: "type")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ticket.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: ticketInstance, field: "status")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="ticket.deadline.label" default="Deadline" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${ticketInstance?.deadline}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${ticketInstance?.id}" />
                    <span class="button"><a href="edit?id=${ticketInstance?.id}" id="edit">Edit</a></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
