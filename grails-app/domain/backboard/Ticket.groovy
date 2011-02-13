package backboard

class Ticket {

    /** タイトル */
    String title
    /** 内容 */
    String content
    /** 担当者 */
    String owner
    /** タイプ */
    String type = 'feature'
    /** 状態 */
    String status = 'new'
    /** 期限 */
    Date deadline

    static constraints = {
        title(blank: false)
        content(blank: true, nullable: true)
        owner(blank: true, nullable: true)
        type(blank: false)
        status(blank: false)
        deadline(nullable: true)
    }
}
