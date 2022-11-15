module Authenticable
  def current_student
    return @current_student if @current_student

    header = request.headers['Authorization']
    return if header.blank?

    decoded = JsonWebToken.decode(header)
    @current_student = Student.find(decoded[:student_id])
  end
end
