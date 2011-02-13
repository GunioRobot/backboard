package backboard

class TicketController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        params.order = 'desc'
        [ticketInstanceList: Ticket.listOrderById(params), ticketInstanceTotal: Ticket.count()]
    }

    def create = {
        def ticketInstance = new Ticket()
        ticketInstance.properties = params
        return [ticketInstance: ticketInstance]
    }

    def save = {
        def ticketInstance = new Ticket(params)
        if (ticketInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'ticket.label', default: 'Ticket'), ticketInstance.id])}"
//            redirect(action: "show", id: ticketInstance.id)
            redirect(action: "list", params: params)
        }
        else {
            render(view: "create", model: [ticketInstance: ticketInstance])
        }
    }

    def show = {
        def ticketInstance = Ticket.get(params.id)
        if (!ticketInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])}"
            redirect(action: "list")
        }
        else {
            [ticketInstance: ticketInstance]
        }
    }

    def edit = {
        def ticketInstance = Ticket.get(params.id)
        if (!ticketInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [ticketInstance: ticketInstance]
        }
    }

    def update = {
        def ticketInstance = Ticket.get(params.id)
        if (ticketInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (ticketInstance.version > version) {
                    
                    ticketInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'ticket.label', default: 'Ticket')] as Object[], "Another user has updated this Ticket while you were editing")
                    render(view: "edit", model: [ticketInstance: ticketInstance])
                    return
                }
            }
            ticketInstance.properties = params
            if (!ticketInstance.hasErrors() && ticketInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'ticket.label', default: 'Ticket'), ticketInstance.id])}"
                redirect(action: "show", id: ticketInstance.id)
            }
            else {
                render(view: "edit", model: [ticketInstance: ticketInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def ticketInstance = Ticket.get(params.id)
        if (ticketInstance) {
            try {
                ticketInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'ticket.label', default: 'Ticket'), params.id])}"
            redirect(action: "list")
        }
    }
}
