module ApplicationHelper
    def error_msg(personal_datum, field_name)
        return unless personal_datum.errors.include?(field_name)
        msg = personal_datum.errors.full_messages_for(field_name).each do |error_message|
                "<ul>
                    <li>#{error_message}</li>
                </ul>".html_safe
                end

        "<div style=\"color: red\">
            #{msg}
        </div>".html_safe
    end
end
