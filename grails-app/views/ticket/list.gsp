
<%@ page import="backboard.Ticket" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ticket.label', default: 'Ticket')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <script type="text/javascript" src="/backboard/js/jquery.js"></script>
<script type="text/javascript">
$(function(){
    $(".show").click(function(){
        $("#detail").load(this.href);
        return false;
    });
});
</script>

    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <g:form action="save" >
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

                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>


            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>

                            <g:sortableColumn property="title" title="${message(code: 'ticket.title.label', default: 'Title')}" />

                            <g:sortableColumn property="owner" title="${message(code: 'ticket.owner.label', default: 'Owner')}" />

                            <g:sortableColumn property="type" title="${message(code: 'ticket.type.label', default: 'Type')}" />

                            <g:sortableColumn property="status" title="${message(code: 'ticket.status.label', default: 'Status')}" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ticketInstanceList}" status="i" var="ticketInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

<%--
                            <td><g:link action="show" id="${ticketInstance.id}">${fieldValue(bean: ticketInstance, field: "id")}</g:link></td>
${ticketInstance.id}
--%>

                            <td><a href="show?id=${ticketInstance.id}" class="show">
                            ${fieldValue(bean: ticketInstance, field: "title")}
                            </a></td>
                            <td>${fieldValue(bean: ticketInstance, field: "owner")}</td>

                            <td>${fieldValue(bean: ticketInstance, field: "type")}</td>

                            <td>${fieldValue(bean: ticketInstance, field: "status")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ticketInstanceTotal}" />
            </div>

        <div id="detail"></div>
        <div id="edit"></div>
        </div>

    </body>
</html>
