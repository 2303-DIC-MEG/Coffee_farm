module ApplicationHelper
  def render_qr_code(content, options = {})
    qrcode = RQRCode::QRCode.new(content)
    svg = qrcode.as_svg(options.merge(size: size)).html_safe
    svg_tag = content_tag(:div, svg, class: 'qr-code')
    svg_tag.html_safe
  end
end

