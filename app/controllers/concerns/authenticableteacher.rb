module Authenticableteacher
  def current_teacher
    return @current_teacher if @current_teacher

    header = request.headers['Authorization']
    return if header.blank?

    decoded = JsonWebToken.decode(header)
    @current_teacher = Teacher.find(decoded[:teacher_id])
  rescue StandardError => e
    e.message
  end
end
