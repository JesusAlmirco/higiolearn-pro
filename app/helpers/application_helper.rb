module ApplicationHelper
    def avatar_url(user)
        if user.avatar.attached?
            url_for(user.avatar)
        # elsif user.image?
        #     user.image
        else
            ActionController::Base.helpers.asset_path('avatar_default.svg')
        end
    end

    # IMPLENTED CODERAY
    class CodeRayifty < Redcarpet::Render::HTML
        def block_code(code, language)
            CodeRay.scan(code, language).div(:line_numbers => :table)
        end
    end

    # IMPLENTED MARKDOWN
    def markdown(text)
        coderayified = CodeRayifty.new(:filter_html => true, :hard_wrap => true)
        options = {
            :fenced_code_blocks  => true,
            :no_intra_emphasis  => true,
            :autolink  => true,
            :strikethrough  => true,
            :lax_spacing  => true,
            :superscript  => true
        }
        
        markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
        markdown_to_html.render(text).html_safe
    end
end
