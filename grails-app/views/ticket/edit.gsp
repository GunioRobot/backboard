

<%@ page import="backboard.Ticket" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
        <script type="text/javascript" src="/backboard/js/jquery.js"></script>
<script type="text/javascript">
$(function(){
    $("#update").click(function(){
        var id = $("#tid").val();
        $.ajax({
            method : 'post',
            action: 'update',
            data:{
                id : id,
                version : $("#version").val(),
                title: $("#title").val(),
                content: $("#content").val(),
                type:$("#type").val(),
                status:$("#status").val()
            },
            success: function(data) {
                $("#detail").load('show?id=' + id);
            },
            error : function() {
            }
        });
        return false;
    });
});
</script>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ticketInstance}">
            <div class="errors">
                <g:renderErrors bean="${ticketInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" id="ticketForm">
                <g:hiddenField name="id" id="tid" value="${ticketInstance?.id}" />
                <g:hiddenField name="version" id="version" value="${ticketInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="title"><g:message code="ticket.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${ticketInstance?.title}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="content"><g:message code="ticket.content.label" default="Content" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'content', 'errors')}">
                                    <g:textField name="content" value="${ticketInstance?.content}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="owner"><g:message code="ticket.owner.label" default="Owner" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'owner', 'errors')}">
                                    <g:textField name="owner" value="${ticketInstance?.owner}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="type"><g:message code="ticket.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'type', 'errors')}">
                                    <g:textField name="type" value="${ticketInstance?.type}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="status"><g:message code="ticket.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'status', 'errors')}">
                                    <g:textField name="status" value="${ticketInstance?.status}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="deadline"><g:message code="ticket.deadline.label" default="Deadline" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ticketInstance, field: 'deadline', 'errors')}">
                                    <g:datePicker name="deadline" precision="day" value="${ticketInstance?.deadline}" default="none" noSelection="['': '']" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><a href="update?id=${ticketInstance?.id}" id="update">Update</a></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
