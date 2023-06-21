module ApplicationHelper
  def render_qr_code(content, options = {})
    size = options.delete(:size)
    qrcode = RQRCode::QRCode.new(content)
    svg = qrcode.as_svg(options).html_safe
    svg_tag = content_tag(:div, svg, class: 'qr-code')
    svg_tag.html_safe
  end
end

